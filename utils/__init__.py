from itertools import chain
from enum import Enum, unique
from datetime import datetime, date
import xmltodict
import hashlib
import random
import string
import time
import os
from PIL import Image
import qiniu
import uuid
import io
from utils.config import QINIU_ACCESS_KEY, QINIU_SECRET_KEY, QINIU_BUCKET_DOMAIN, QINIU_BUCKET_NAME
import requests
from django.db.models import DateTimeField, ImageField, FileField
from django.http import HttpResponse, JsonResponse
from django.utils.html import format_html
from .config import MEDIA_URL


# from group.settings import MEDIA_URL, HOST_URL


@unique
class Code(Enum):
    """
    错误码定义 <错误级别1位|服务模块2位|具体错误2位>20501  参考微博 https://open.weibo.com/wiki/Error_code
    级别：1系统级错误, 具体处理外的错误，主要在中间件/顶级装饰器中
         2服务级错误, 具体接口中出现的错误
    模块：00本地处理异常
         01微信接口异常
         02短信接口异常

         3 token过期
         4 导游忙碌
    """
    SUCCESS = (0, '成功')
    UNKNOWN = (10000, '未知错误')
    ILLEGAL = (10001, '非法请求')
    SYSTEM_BUSY = (10002, '系统繁忙')
    SIGN_ERROR = (10003, '签名错误')
    TOKEN_EXPIRED = (10004, 'token过期')
    PARAM_MISS = (20000, '缺少参数')
    PARAM_ERROR = (20001, '参数错误')
    NAME_PASSWORD_ERROR = (20002, '用户名或密码错误')
    DATA_EXISTED = (20003, '数据已存在')
    DATA_NOT_FOUND = (20004, '数据不存在')
    USER_NOT_FOUND = (20005, '用户不存在')
    INVALID_CODE = (20201, '验证码错误')


class RespData(Exception):
    """
    使用抛异常的方式直接返回结果，不需要
    """

    def __init__(self, data: dict):
        super(RespData, self).__init__()
        self.data = data

    def __str__(self):
        return ''


def get_url(obj):
    if not obj:
        return ''
    if str(obj).startswith('http'):
        return str(obj)
    if isinstance(obj, str):
        return os.path.join(MEDIA_URL, obj)
    return obj.url


def model_2_dict(instance, fields=None, exclude=None):
    """
    自定义model转字典，处理文件时自动加域名，处理时间时转换
    :param instance:
    :param fields:
    :param exclude:
    :return:
    """
    opts = instance._meta
    data = {}
    for f in chain(opts.concrete_fields, opts.private_fields, opts.many_to_many):
        # if not getattr(f, 'editable', False):
        #     print('edit:', f.name)
        #     continue
        if f.name == 'deleted':
            continue
        if fields and f.name not in fields:
            continue
        if exclude and f.name in exclude:
            continue

        if isinstance(f, (ImageField, FileField)):
            tmp = f.value_from_object(instance)
            data[f.name] = get_url(tmp)
        elif isinstance(f, DateTimeField):
            tmp = f.value_from_object(instance)
            data[f.name] = tmp.strftime('%Y-%m-%d %H:%M:%S') if tmp else None
        else:
            data[f.name] = f.value_from_object(instance)
    return data


def gen_resp(code: [int, Code] = 0, msg: str = '', **kwargs):
    """
    对返回内容进行编码处理
    返回数据以key=val的形式提供


    :param code: int 或 错误枚举类型
    :param msg:
    :param kwargs: 实际需要返回的数据
    :return: JsonResponse
    """
    if isinstance(code, Code):
        kwargs = {'code': code.value[0], 'msg': f'{code.value[1]}:{msg}'}
    else:
        kwargs.update({'code': code, 'msg': msg})

    if not kwargs['msg']:
        del kwargs['msg']

    return JsonResponse(kwargs, json_dumps_params={'ensure_ascii': False})


# def get_save_path(model, fname: str):
#     """
#     文件名保存规则
#     最好是能将商户ID放到路径，这样每个商户的图片不会太多，就不需要加太多的路径
#     :param model:
#     :param fname:
#     :return:
#     """
#     ext = fname[fname.rindex('.'):]
#     now = datetime.now()
#     key = hashlib.md5((model.appid + str(now) + fname).encode()).hexdigest()[-20:]
#
#     from main.models import Guide  # 避免循环import
#     merc = Guide.objects.filter(appid=model.appid).first()
#
#     new_fname = f"{now.strftime('%Y/%m/%d')}/{key+ext}"
#     if merc:
#         new_fname = f'{merc.id}/{new_fname}'
#     return new_fname


def show_img(obj, w=50, h=50):
    """
    url 转图片显示, 仅用于admin
    :param obj:
    :param w:
    :param h:
    :return:
    """

    return format_html('<img height={} width={} style="object-fit: cover" src="{}"/>',
                       w, h, obj.url if obj else '')


def show_video(obj, w=80, h=80):
    """

    :param obj:
    :param w:
    :param h:
    :return:
    """
    return format_html('<a href="{0}"><img style="width:{1}px;height:{2}px" src="{0}" /></a>',
                       obj.url if obj else '', w, h)


def rand_str(length=20):
    return ''.join(random.sample(string.digits + string.ascii_letters, length))


def get_page(raw):
    try:
        page = int(raw or '0')
        if page < 0:
            return None, gen_resp(Code.PARAM_ERROR, 'page')
        page = page or 1
        return page - 1, None
    except Exception as err:
        return None, gen_resp(Code.PARAM_ERROR, str(err))


def clear_data(data, must: list = None, option: list = None) -> (dict, str):
    tmp = {}
    for itm in must or []:
        if itm not in data:
            return None, gen_resp(Code.PARAM_MISS, itm)
        tmp[itm] = data[itm]

    for itm in option or []:
        if itm in data:
            tmp[itm] = data[itm]

    return tmp, None


# def src_split(line):
#     if not line:
#         return []
#     return [os.path.join(MEDIA_URL, itm) for itm in line.split('|') if itm]


def wx_sign(data, secret):
    """
    微信签名
    :param data:
    :param secret: 签名秘钥
    :return:
    """

    src = ''
    for key in sorted(data):
        if data[key]:
            src += '{}={}&'.format(key, data[key])
    src += "key=" + secret
    sign = hashlib.md5(src.encode('utf-8')).hexdigest().upper()
    return sign


def wx_reply(msg=None):
    return HttpResponse(xmltodict.unparse({
        "xml": {
            "return_code": "FAIL" if msg else "SUCCESS",
            "return_msg": msg
        }
    }, full_document=False))


def calcu_year(birth):
    now = date.today()
    try:
        tmp = birth.replace(year=now.year)
    except ValueError:  # raised when birth date is February 29 and the current year is not a leap year
        tmp = birth.replace(year=now.year, month=birth.month + 1, day=1)

    return now.year - birth.year - 1 if tmp > now else now.year - birth.year


def gen_order_no(userid):
    """
    订单生成规则， {客户渠道}{支付渠道}{业务编号}{年月日}{随机}{用户ID}
    1001031
    客户渠道：1小程序, 2客户端
    支付渠道：0微信, 1支付宝, 2银行卡
    业务编号：0炭
    时间月日：取年月日，方便快速定位时间
    用户编号：4位固定, 用户量
    随机号码：防重复2位，(单个用户一天订单量不会太多)，扩展时优先扩展此字段

    :param userid: 用户ID
    :param cli: 客户渠道
    :param pay: 支付渠道
    :param bus: 业务类型
    :return:
    """

    return '{}{}{}'.format(
        time.strftime('%Y%m%d')[2:],
        '{:0>4}'.format(userid)[-4:],
        ''.join(random.sample(string.digits, 3))
    )


def gen_out_no(role, ugid, index=0):
    """生成提现单号"""
    return f"{role}{ugid}{time.strftime('%Y%m%d')[2:]}{'{:0>3}'.format(index)}"


def upload(img):
    """
    上传图片,img为网络图片

    :param img:
    :return:
    """

    q = qiniu.Auth(QINIU_ACCESS_KEY, QINIU_SECRET_KEY)
    key = str(uuid.uuid1()).replace('-', '') + '.png'
    r = requests.get(img)
    with open('/home/aek/group/media/{0}'.format(key), 'wb') as f:
        f.write(r.content)
    file = open('/home/aek/group/media/{0}'.format(key), 'rb')
    _img = file.read()
    size = len(_img) / (1024 * 1024)  # 上传图片的大小 M单位

    image = Image.open(io.BytesIO(_img))

    name = 'upfile.{0}'.format(image.format)  # 获取图片后缀（图片格式）
    print(size)
    if size > 1:
        # 压缩
        x, y = image.size
        im = image.resize((int(x / 1.73), int(y / 1.73)), Image.ANTIALIAS)  # 等比例压缩 1.73 倍
    else:
        # 不压缩
        im = image

    im.save('./media/' + name)  # 在根目录有个media文件
    path = './media/' + name

    token = q.upload_token(QINIU_BUCKET_NAME, key, 3600, )

    qiniu.put_file(token, key, path)
    return key


def t2s(t):
    """
     时分秒 转 秒
     :param s:
     :return:
     """
    h, m, s = str(t).strip().split(":")
    return int(h) * 3600 + int(m) * 60 + int(s)


def s2t(s):
    """
    秒 转 时分秒
    :param s:
    :return:
    """

    m, s = divmod(s, 60)
    h, m = divmod(m, 60)
    return "%02d:%02d" % (h, m)
