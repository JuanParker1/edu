from django.db import transaction
import logging
import requests
import json
import qiniu
from django.db.models import Sum, Avg, Q, F
from django.views.generic.base import View
from django.views.decorators.http import require_POST
from django.shortcuts import render
import datetime
from utils import *
from utils.wxtool import *
from utils.config import *
from utils.auth import Auth
from .models import *
from operator import itemgetter
from dateutil.relativedelta import relativedelta
from django.core.paginator import Paginator

# Create your views here.


log = logging.getLogger()


def login(request):
    """
    获取token

    /openid?code=xxx  取用户token
    """

    code = request.GET.get('code')
    if not code:
        return gen_resp(Code.PARAM_MISS)
    try:
        rsp = requests.get('https://api.weixin.qq.com/sns/jscode2session', params={
            "appid": ID,
            "secret": KEY,
            "js_code": code,
            "grant_type": "authorization_code"})
        data = rsp.json()
        openid = data.get('openid')
        key = data.get('session_key')
        if not openid:
            return gen_resp(2, data.get('errcode'))
        user, new = User.objects.get_or_create(openid=openid)
        if new:
            user.key = key
            user.save()
    except Exception as e:
        log.info(e)
        return gen_resp(2)
    # 生成token
    token = Auth.create_token(user.openid, user.key, user.id, user.utype)
    data = {
        "token": token,
        "utype": user.utype,

    }
    log.info(data)
    return gen_resp(0, "成功", data=data)


def mytch(request):
    user = request.user
    orders = Order.objects.filter(user=user.id)
    tch = []
    # 个人信息
    year = datetime.datetime.now().year
    for i in orders:
        if i.teacher and i.teacher.name:
            tch.append(i.teacher)
    new_tch = []
    for i in set(tch):
        i.ocp = i.get_ocp_display()
        users = model_2_dict(i)

        try:
            users['age'] = year - i.birth.year
        except:
            users['age'] = None

        image = UserDetail.objects.filter(user=user, )
        if image:
            users['image'] = [i.image.url for i in image]

        new_tch.append(users)
    return gen_resp(0, "成功", data=new_tch)


# def cut(request):
#     """
#     切换身份
#     :param request:
#     :return:
#     """
#
#     user = request.user
#     utype = request.GET.get('utype')
#     # 用户->教师
#     if utype == 3:
#         # 生成token
#         token = Auth.create_token(user.openid, user.key, user.id, utype)
#         return gen_resp(0, "成功", data=token)
#     # 教师->用户
#     if utype == 2:
#         # 生成token
#         token = Auth.create_token(user.openid, user.key, user.id, utype)
#         return gen_resp(0, "成功", data=token)

@require_POST
def land(request):
    """
    保存微信用户信息
    :param request:
    :return:
    """
    user = request.user

    data = json.loads(request.body)
    data, rsp = clear_data(data, must=['avatarUrl', 'city', 'gender', 'nickName'])
    # try:
    key = upload(data['avatarUrl'])
    # except:
    #     key = None
    user.avatar = key
    user.wx_name = data['nickName']
    user.sex = True if data['gender'] == 1 else False
    user.city = data['city']
    user.save()
    return gen_resp(0, data=model_2_dict(user))


class UserInfo(View):

    def get(self, request):
        """
        请求用户信息
        :param request:
        :return:
        """
        user = request.user
        data = model_2_dict(user)
        detail = UserDetail.objects.filter(user=user.id)
        data['images'] = [model_2_dict(i) for i in detail]
        return gen_resp(0, data=data)

    def post(self, request):
        """
        请求用户信息
        :param request:
        :return:
        """
        user = request.user
        data = json.loads(request.body)
        if data['avakey']:
            user.avatar = data['avakey']

        try:
            user.industry = Industry.objects.filter(name=data['industry']).first()
        except:
            pass
        if data['birth'] != None:
            user.birth = data['birth']
        if data['mail'] != None:
            user.mail = data['mail']
        if data['phone'] != None:
            user.phone = data['phone']
        if data['ocp'] != None:
            user.ocp = data['ocp']
        if data['wx_num'] != None:
            user.wx_num = data['wx_num']
        if data['wsk'] != None:
            user.wsk = data['wsk']
        if data['sex'] != None:
            user.sex = data['sex']
        if data['name'] != None:
            user.name = data['name']
        if data['edu'] != None:
            user.edu = data['edu']
        if data['height'] != None:
            user.height = data['height']
        if data['weight'] != None:
            user.weight = data['weight']
        if data['content'] != None:
            user.content = data['content']
        if data['sign'] != None:
            user.sign = data['sign']
        user.save()

        # 详情
        if data['images']:
            for i in data['images']:
                if not 'id' in i:
                    UserDetail.objects.filter(user=user.id).delete()
                    UserDetail.objects.create(user=user, image=i)

        data = model_2_dict(user)
        detail = UserDetail.objects.filter(user=user.id)
        data['images'] = [model_2_dict(i) for i in detail]
        return gen_resp(0, '成功')


@require_POST
def apply(request):
    """
    申请教师
    :param request:
    :return:
    """
    user = request.user
    data = json.loads(request.body)
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(data))

    apply = Apply.objects.filter(user=user)

    data['sex'] = False if data['sex'] == 2 else True
    if apply:
        apply.update(
            user=user,
            name=data['name'],
            phone=data['phone'],
            city=data['city'],
            wsk=data['wsk'],
            mail=data['email'],
            edu=data['edu'],
            sex=data['sex'],
            acert=data['acert'],
            tcert=data['tcert'],
            picture=data['picture'],
            content=data['content'],
            voice=data['voice'],
        )
        data = model_2_dict(apply[0])
    else:
        apply = Apply()
        apply.user = user
        apply.name = data['name']
        apply.phone = data['phone']
        apply.city = data['city']
        apply.wsk = data['wsk']
        apply.mail = data['email']
        apply.edu = data['edu']
        apply.sex = data['sex']
        apply.acert = data['acert']
        apply.tcert = data['tcert']
        apply.picture = data['picture']
        apply.content = data['content']
        apply.voice = data['voice']
        apply.save()
        data = model_2_dict(apply)

    return gen_resp(0, "申请成功", data=data)


def apply_record(request):
    user = request.user
    apply = Apply.objects.filter(user=user.id)
    code = 0
    cause = None
    if apply:
        code = 1  # 申请中
        if apply[0].status == 1:  # 未通过
            code = 2
            cause = apply[0].cause
        if apply[0].status == 2:  # 已通过
            code = 3
    return gen_resp(0, '成功', data=code, cause=cause)


@require_POST
def phone(request):
    """
    获取手机号，解密
    :param request:
    :return:
    """

    data = json.loads(request.body)

    data, rsp = clear_data(data, must=['encryptedData', 'iv', 'code'], option=['1111'])
    content = session_key(data['code'])
    session = content['session_key']
    openid = content['openid']
    pc = WXBizDataCrypt(ID, session)
    decrypted = pc.decrypt(data['encryptedData'], data['iv'])
    tem = decrypted['purePhoneNumber']
    try:
        user = User.objects.filter(openid=openid)
        user.update(phone=tem)
        # 生成token
        token = Auth.create_token(openid, user[0].key, user[0].id, False)
        return gen_resp(0, data=token)
    except:
        return gen_resp(0)


def home(request):
    """
    获取分类，及banner
    /home
    :return: banner，sort
    """

    banner = Banner.objects.all()
    banner_list = []
    for i in banner:
        dic = {"id": i.id}
        dic["sub_id"] = i.sub.id
        dic["img"] = i.img.url
        banner_list.append(dic)
    sort = [model_2_dict(i) for i in Sort.objects.all()]
    for s in sort:
        sub = Subject.objects.filter(sort=s['id'])
        list = []
        for i in sub:
            dic = {}
            time = List.objects.filter(sub=i.id).aggregate(Sum('time'))['time__sum']
            hour = str(int(time / 60)) + "小时" + str(int(time % 60)) + '分钟'

            dic['hour'] = hour
            dic['sort_id'] = i.sort.id
            dic['sort'] = i.sort.name
            dic['name'] = i.name
            dic['main'] = i.main.url
            dic['id'] = i.id
            list.append(dic)
        s["list"] = list

    data = {
        "banner": banner_list,
        "sort": sort,

    }

    return gen_resp(0, data=data)


def ready(request):
    """
    查看有没有礼物
    :param request:
    :return:
    """
    user = request.user
    # 查看自己有没有领取礼物
    gift = True if COrder.objects.filter(userId=user.id, fee=0) else False
    # 刷新用户身份
    utype = user.utype if user.utype else 1
    # 用户信息
    userInfo = model_2_dict(user)
    detail = UserDetail.objects.filter(user=user.id)
    userInfo['images'] = [model_2_dict(i) for i in detail]
    data = {
        "utype": utype,
        "gift": gift,
        "userInfo": userInfo

    }
    return gen_resp(0, data=data)


def sort(request):
    """
    获取分类，拼课页面
    :param request:
    :return:
    """
    sort = [model_2_dict(i) for i in Sort.objects.all()]
    return gen_resp(0, '成功', data=sort)


def sub_list(request):
    """
    获取课程列表
    sort    类别id
    :return:list
    """
    sort = request.GET.get('sort') or '1'
    krags = {}
    if sort:
        krags['sort'] = sort
    sub = Subject.objects.filter(**krags)
    list = []
    for i in sub:
        dic = {}
        time = List.objects.filter(sub=i.id).aggregate(Sum('time'))['time__sum']
        hour = str(int(time / 60)) + "小时" + str(int(time % 60)) + '分钟'

        dic['hour'] = hour
        dic['sort_id'] = i.sort.id
        dic['sort'] = i.sort.name
        dic['name'] = i.name
        dic['main'] = i.main.url
        dic['id'] = i.id
        list.append(dic)
    return gen_resp(0, data=list)


def sub_detail(request):
    """
    课程详情
    :param request: 课程id
    :return:
    """
    user = request.user
    id = request.GET.get('id')
    # try:
    sub = Subject.objects.get(id=id)
    # 详情
    datail = Detail.objects.filter(sub=id)
    datail_list = []

    if datail:
        for i in datail:
            dic = {}
            dic['name'] = i.name

            dic['image'] = i.image.url if i.image else None
            datail_list.append(dic)
    # 目录
    list = [model_2_dict(i) for i in List.objects.filter(sub=id)]

    # 轮询订单
    for l in list:
        order = Order.objects.filter(list=l['id'], sub=id, user=user).filter(~Q(status=3)).first()
        if order:
            l['user'] = order.user.avatar.url
            if order.partner:
                l['partner'] = order.partner.avatar.url
    # 评价
    new_list = []
    for i in Comment.objects.filter(sub=id).order_by('-created'):
        dic = {}
        dic['user'] = model_2_dict(i.user)
        dic['comment'] = i.comment
        dic['type'] = i.type
        dic['created'] = i.created
        dic['oid'] = i.oid
        dic['tch_star'] = i.tch_star
        dic['sub_star'] = i.sub_star
        new_list.append(dic)

    new_dic = {}
    for item in new_list:
        oid = item.get('oid')

        if not new_dic.get(oid):
            new_dic[oid] = [item]
        else:
            new_dic[oid].append(item)
    comment = []
    for k, v in new_dic.items():
        comment.append(v)
    # ----
    main_list = []
    main_list.append(sub.main.url)

    for m in datail_list:
        if (m['image'] and len(main_list) < 5):
            main_list.append(m['image'])
    subject = {}
    # subject['team_type'] = order.get_team_type_display()
    subject['main'] = main_list
    subject['name'] = sub.name
    subject['detail'] = datail_list
    subject['list'] = list
    subject['comment'] = comment

    # except Exception as e:
    #     log.info("错误：" + str(e))
    #     return gen_resp(1, "数据不存在")
    # log.info(subject)
    return gen_resp(0, data=subject)


def teacher_list(request):
    """
    教师列表
    :param request:
    :return:
    """
    teacher = User.objects.all()
    list = []
    for t in teacher:
        free_time = FreeTime.objects.filter(tch=t.id, free__range=['2019-08-21', '2019-08-21'])
        free = [model_2_dict(ft) for ft in free_time]
        dic = {}
        dic['free'] = free
        dic['teacher'] = model_2_dict(t)
        list.append(dic)
    return gen_resp(0, data=list)


def order(request):
    """
    拼课列表
    :param request:
    :return:
    """
    user = request.user
    NUM_PER_PAGE = 3
    page, rsp = get_page(request.GET.get('page', '0'))
    if rsp:
        return rsp

    data = request.GET.dict()
    year = datetime.datetime.now().year
    now = datetime.datetime.now()
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(data))
    # 过期数据
    Order.objects.filter(status=0, time__date=now.date(), time__start__lt=now.time()).update(
        status=6)
    Order.objects.filter(status=0, time__date__lt=now.date()).update(
        status=6)
    krags = {}
    if "freetime" in data:
        krags['time'] = data['freetime']
    if "list_id" in data:
        krags['list'] = data['list_id']
    if "classify" in data:
        krags['sub__sort'] = data['classify']
    # 性别
    if "sex" in data:
        krags['user__sex'] = True if data['sex'] == "true" else False
    # 年龄
    if "ages" in data:

        if data['ages'] == "50岁以上":
            krags['user__birth__year__lte'] = year - 50
        else:
            da = data['ages'].replace('岁', '').split('-')

            krags['user__birth__year__lte'] = year - int(da[0])
            krags['user__birth__year__gte'] = year - int(da[1])
    # 职业
    if "occ" in data:
        krags['user__ocp'] = data['occ']
    # 学历
    if "edu" in data:
        krags['user__edu'] = data['edu']

    krags['status'] = 0
    log.info(krags)
    if "sorting" in data and data['sorting'] == '2':
        order = Order.objects.filter(**krags).filter(~Q(team_type=2)).order_by("-created")[
                page * NUM_PER_PAGE: (page + 1) * NUM_PER_PAGE]
    else:
        order = Order.objects.filter(**krags).filter(~Q(team_type=2))[page * NUM_PER_PAGE: (page + 1) * NUM_PER_PAGE]
    list = []
    try:
        for o in order:
            dic = {}
            dic['user'] = model_2_dict(o.user)
            try:
                dic['user']['age'] = year - o.user.birth.year
            except:
                dic['user']['age'] = None
            dic['user']['ocp'] = o.user.get_ocp_display()
            dic['teacher'] = model_2_dict(o.teacher)
            # 评分
            dic['teacher']['score'] = float(5)
            dic['sub'] = model_2_dict(o.sub)
            dic['sub']['sort_name'] = o.sub.sort.name
            # 目录
            dic['list'] = model_2_dict(o.list)
            dic['id'] = o.id
            # 组队类型
            dic['type_id'] = o.team_type
            # 特定条件
            if o.team_type == 1:
                seach = SearchType.objects.filter(ord=o.id)
                dic['seach'] = []

                for s in seach:
                    sdic = {}

                    sdic['type'] = s.get_type_display()
                    sdic['type_id'] = s.type
                    sdic['value'] = s.value

                    if s.type == 1:
                        sdic['value'] = '男' if s.value == "True" else '女'
                    if s.type == 2:
                        eng_level = ["零基础", "入门级", "高中水平", "大学英语四级", "大学英语四级"]
                        sdic['value'] = eng_level[int(s.value)]
                    dic['seach'].append(sdic)
            list.append(dic)
    except Exception as e:
        log.error("错误信息==============》》》》》》》" + str(e))
    return gen_resp(0, '成功', data=list)


def order_detail(request):
    """
    拼课详情
    :param request:
    :return:
    """
    user = request.user
    id = request.GET.get('id')
    order = Order.objects.get(id=id)
    dic = {}
    # 个人信息
    year = datetime.datetime.now().year
    dic['user'] = model_2_dict(order.user)
    try:
        dic['user']['age'] = year - order.user.birth.year
    except:
        dic['user']['age'] = None
    dic['user']['ocp'] = order.user.get_ocp_display()
    image = UserDetail.objects.filter(user=user, )
    if image:
        dic['user']['image'] = [i.image.url for i in image]
    try:
        dic['partner'] = model_2_dict(order.partner)
    except:
        pass
    # 教师资料
    apply = Apply.objects.filter(user=order.teacher).first()
    dic['teacher'] = model_2_dict(apply)
    # 评分
    dic['teacher']['score'] = 5
    dic['sub'] = model_2_dict(order.sub)
    # 课程详情
    detail = Detail.objects.filter(sub=order.sub.id)
    src = []
    for i in detail:
        if i.image:
            src.append(i.image.url)
    src.append(order.sub.main.url)
    dic['sub']['main'] = src
    # 目录
    dic['list'] = model_2_dict(order.list)
    dic['sub']['sort'] = order.sub.sort.name
    dic['list']['hour'] = str(int(order.list.time / 60)) + "小时" + str(int(order.list.time % 60)) + '分钟'
    dic['id'] = order.id
    # 匹配规则
    dic['team_type'] = order.get_team_type_display()
    dic['type_id'] = order.team_type
    # 实付
    dic['price'] = order.price
    # 状态
    dic['status'] = order.status
    # 上课时间
    dic['time'] = model_2_dict(order.time)
    # # classin账号密码
    # u_at = UAccount.objects.get(user=user.id)
    # dic['classin'] = model_2_dict(u_at)
    # 开课时间
    dic['time'] = model_2_dict(order.time)
    return gen_resp(0, '成功', data=dic)


def qiniu_token(request):
    """
    获取七牛云token
    """
    try:
        q = qiniu.Auth(QINIU_ACCESS_KEY, QINIU_SECRET_KEY)
        token = q.upload_token(QINIU_BUCKET_NAME, policy={'saveKey': 'image/${etag}${ext}'})
    except Exception as e:
        log.error('获取七牛云token失败:' + str(e))
        return gen_resp(10000, '获取七牛云token失败')

    return gen_resp(0, '获取成功', data=token)


def industry(request):
    """
    请求行业列表
    :param request:
    :return:
    """
    ind = Industry.objects.all()
    list = []
    try:
        for i in ind:
            list.append(i.name)
    except:
        pass
    return gen_resp(0, "成功", data=list)


def card(request):
    """
    会员卡列表
    :param request:
    :return:
    """
    card = Card.objects.all()
    data = [model_2_dict(c) for c in card]
    return gen_resp(0, "成功", data=data)


@require_POST
def order_pay(request):
    user = request.user
    if not isinstance(user, User):
        return gen_resp(Code.ILLEGAL)

    data, rsp = clear_data(request.json, must=['id'])
    if rsp:
        return rsp

    id = data['id']

    card = Card.objects.filter(id=id).first()
    if not card:
        return gen_resp(Code.DATA_NOT_FOUND, f'会员{card.id}')

    # if ode.status != 0:
    #     return gen_resp(2, '订单状态异常')
    #
    # if (timezone.now() - ode.created).seconds > 30 * 60:
    #     return gen_resp(2, '支付超时重新下单')

    # total_fee = int(card.price * 100)
    total_fee = 1  # 测试付款一分钱 上线删除
    trade_no = gen_order_no(user.id)
    nonce_str = rand_str(12)
    tmp = {
        'openid': user.openid,
        'appid': ID,
        'mch_id': MCH_ID,
        'nonce_str': nonce_str,
        'body': 'AECLUB',
        'out_trade_no': trade_no,
        'total_fee': total_fee,
        'spbill_create_ip': '47.110.13.254',
        'notify_url': NOTI_URL,
        'trade_type': "JSAPI",
    }

    tmp['sign'] = wx_sign(tmp, MCH_KEY)

    try:
        xml = xmltodict.unparse({"xml": tmp}, full_document=False)
        rsp = requests.post('https://api.mch.weixin.qq.com/pay/unifiedorder', data=xml.encode())
        ret = xmltodict.parse(rsp.content.decode())["xml"]
        log.info('wx uniorder return: {} {}'.format(data['id'], ret))

        if ret['return_code'] != 'SUCCESS':
            return gen_resp(1, '支付通信错误:' + ret["return_msg"])
        if ret["result_code"] != "SUCCESS":
            log.error('{} uniorder code|des {}:{}'.format(data['id'], ret["err_code"], ret["err_code_des"]))
            return gen_resp(1, '支付处理错误')

        # 返回支付请求数据
        wxdata = {
            'appId': ID,
            'nonceStr': nonce_str,
            'timeStamp': str(int(time.time())),
            'package': "prepay_id=" + ret["prepay_id"],
            'signType': 'MD5'
        }
        wxdata['paySign'] = wx_sign(wxdata, MCH_KEY)

        # 成功会员订单
        COrder.objects.create(orderNo=nonce_str, tradeNo=trade_no, userId=user.id, card_id=id, fee=total_fee / 100,
                              payTime=datetime.datetime.now(), have=card.num)

        return gen_resp(0, '成功', data=wxdata)

    except Exception as err:
        log.error('微信下单失败:{} {}'.format(data['id'], err))
        return gen_resp(2, '请求支付参数出错')


@require_POST
def pay_noti(request):
    log.info('微信支付通知数据: {}'.format(request.body.decode()))

    try:
        data = xmltodict.parse(request.body.decode()).get("xml", {})
    except Exception as e:
        log.error('支付通知数据处理异常:{}'.format(e))
        return wx_reply("数据处理异常")

    if "sign" not in data:
        log.error('支付通知没有sign字段:{}'.format(data))
        return wx_reply("没有sign字段")

    if data["return_code"] != "SUCCESS":
        log.error('支付通知通信错误:{}'.format(data["return_msg"]))
        return wx_reply("通信错误")

    sign = data.pop("sign")
    if sign != wx_sign(data, MCH_KEY):
        log.error('支付通知签名错误:{}'.format(data))
        return wx_reply("签名错误")

    trade_no = data['out_trade_no']

    # ode: Order = Order.objects.select_related('orderdetail').filter(tradeNo=trade_no).first()
    # if not ode:
    #     log.error('支付通知订单不存在{} {}'.format(trade_no, data))
    #     return wx_reply('订单不存在')
    #
    # if ode.payNoti == 1:
    #     return wx_reply()

    # if data["result_code"] != "SUCCESS":
    #     log.error('交易号为:{}的订单未支付成功|错误码和描述 {}:{}'.format(ode.tradeNo, data["err_code"], data["err_code_des"]))
    #     ode.payNoti = 2
    #     ode.save()
    #     return wx_reply()

    # 下发模板消息

    # 更新项目购买次数
    # pid = ode.orderdetail.pId
    # oids = Order.objects.filter(guide=ode.guide, status__in=[2, 3, 4]).values_list('id', flat=True)
    # cnt = OrderDetail.objects.filter(pId=pid, order_id__in=oids).count()
    # Project.objects.filter(id=pid).update(sales=cnt)  # 项目购买次数
    #
    # ode.payTime = timezone.now()
    # ode.status = 1
    # ode.payNoti = 1
    # ode.save()

    return wx_reply()


def put_order(request):
    """
        修改订单状态,已支付
    :param request:
    :return:
    """

    user = request.user
    data = json.loads(request.body)
    data, rsp = clear_data(data, must=['nonceStr'])
    corder = COrder.objects.filter(orderNo=data['nonceStr'], userId=user.id)
    corder.update(status=1)

    # 课时记录
    Balance.objects.create(user=user.id, num=corder[0].card.num)

    # 购买会员卡后给邀请人返现
    # 检测两个人寸不存在用户关系
    inv = Invite.objects.filter(parnter=user.id, task2=0)
    # 存在改变状态，成可提现
    if inv:
        inv.update(task2_type=1, task2=1, fee=corder[0].fee)

    # 返利
    return gen_resp(0, "成功")


def mycard(request):
    """
    我的会员卡
    :param request:
    :return:
    """

    user = request.user
    corder = COrder.objects.filter(userId=user.id, status=1).first()
    if corder:
        return gen_resp(0, "成功", data=model_2_dict(corder))
    else:
        return gen_resp(0, "未开通会员卡", data=None)


def my_study(request):
    """
    我的学习
    :param request:
    :return:
    """

    user = request.user
    sub = Order.objects.filter(user=user.id)
    data = {}
    # 会员卡
    corder_obj = COrder.objects.filter(userId=user.id, status=1).order_by('-payTime')
    # 存在会员卡
    if len(corder_obj) > 0:
        corder = corder_obj.filter(fee__gt=0).aggregate(Sum('have'))
        money = corder['have__sum']
        data['card'] = money
        data['other'] = corder_obj.filter(fee=0).aggregate(Sum('have'))['have__sum']
        # 过滤奖励的课时订单
        corder_pay = corder_obj.filter(~Q(card=None))[0]
        data['card_start'] = corder_pay.payTime.strftime('%Y-%m-%d')
        data['card_end'] = (corder_pay.payTime + relativedelta(months=corder_pay.card.valid)).strftime('%Y-%m-%d')
    # 待学习
    wait_sub = sub.filter(status=1)

    # 今日待学
    now_time = time.time()
    data['wait'] = len(wait_sub.filter(time__date=datetime.datetime.now(), time__start__gt=datetime.datetime.now()))

    # 连续学习
    sub_ok = sub.filter(status=2).order_by("time__date")

    data['always'] = len(sub)

    # 累计学习
    order_obj = sub_ok.aggregate(Sum('list__time'))

    all_time = order_obj['list__time__sum'] or 0

    data['all_time'] = all_time

    # 最近在学
    sub_list = []
    subs = sub.filter(status=1)
    for s in subs:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)

        sub_list.append(sub_item)
    data['now'] = sub_list

    # 拼课记录
    team_old = sub.filter(Q(status=0) | Q(status=3)).order_by("-created")[:3]
    old_team = []
    for s in team_old:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        sub_item['sub']['sort'] = s.sub.sort.name
        old_team.append(sub_item)
    data['team'] = old_team

    # 报名记录
    sign_w = sub.filter(status=2)[:3]
    sign_l = []
    for s in sign_w:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        sub_item['sub']['sort'] = s.sub.sort.name
        sign_l.append(sub_item)

    data['signup'] = sign_l

    return gen_resp(0, "成功", data=data)


def last_learn(request):
    """
    最近在学
    :param request:
    :return:
    """
    user = request.user
    sub = Order.objects.filter(user=user.id).filter(Q(status=1) | Q(status=5))
    # 投诉表
    complain = Complain.objects.filter(user=user.id)
    # 最近在学
    sub_list = []
    for s in sub:
        sub_item = {}
        sub_item['id'] = s.id
        sub_item['status'] = s.status
        sub_item['time'] = model_2_dict(s.time)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        com = complain.filter(oid=s.id)
        if com:
            sub_item['complain'] = model_2_dict(com[0])
        sub_list.append(sub_item)
    return gen_resp(0, "成功", data=sub_list)


def team_record(request):
    """
    拼课记录
    :param request:
    :return:
    """
    user = request.user
    # 拼课记录
    team_old = Order.objects.filter(user=user.id).filter(
        Q(status=0) | Q(status=3) | Q(status=4) | Q(status=6)).order_by("-created")
    old_team = []
    for s in team_old:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        sub_item['sub']['sort'] = s.sub.sort.name
        old_team.append(sub_item)

    return gen_resp(0, "成功", data=old_team)


def sign_record(request):
    """
    报名记录
    :param request:
    :return:
    """
    # 报名记录
    user = request.user
    sign_w = Order.objects.filter(user=user.id).filter(status=2)
    sign_l = []
    for s in sign_w:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        sub_item['sub']['sort'] = s.sub.sort.name
        sign_l.append(sub_item)
    return gen_resp(0, "成功", data=sign_l)


def partner(request):
    """
    获取学习搭档列表
    :param request:
    :return:
    """

    user = request.user
    list = []
    order = Order.objects.filter(user=user, status=2)
    # 申请表
    befriend = Befriend.objects.filter(user=user.id)
    # 被申请
    apply = Befriend.objects.filter(parnter=user.id, type=1)
    p = []
    for o in order:

        if o.partner and o.partner.id not in p:
            dic = model_2_dict(o.partner)
            year = datetime.datetime.now().year
            # 年龄；
            dic['age'] = year - o.user.birth.year
            # 身份
            dic['ocp'] = o.partner.get_ocp_display()
            be = befriend.filter(parnter=o.partner.id)
            if be:
                dic['apply'] = be[0].type
            else:
                dic['apply'] = 0
            ap = apply.filter(user=o.partner.id)
            if ap:
                dic['apply'] = 4
            list.append(dic)
            p.append(o.partner.id)
    return gen_resp(0, "成功", data=list)


def sub_time(request):
    """
    上课时间配置
    :param request:
    :return:
    """
    user = request.user
    date = request.GET.get("day")
    free_time = FreeTime.objects.filter(tch=user, date=date)

    sub_time_obj = SubTime.objects.all().first()

    ends = str(sub_time_obj.end)
    # jet 00:00:00 转 24：00：00
    if ends.split(':')[0] == "00":
        ends = "24:" + ends.split(':')[1] + ":" + ends.split(':')[2]
    end_hour = int(ends.split(':')[0])
    start_hour = int(str(sub_time_obj.start).split(':')[0])
    dates = []
    for i in range(0, end_hour - start_hour):
        start = t2s(str(sub_time_obj.start))

        interval = int(str(sub_time_obj.time)) * 60
        start_time = s2t(start + interval * i)
        end_time = s2t(start + interval * (i + 1))
        # 不超出24小时
        if start + interval * (i + 1) <= 86400:

            sec = False
            if end_time.split(":")[0] == "24":
                end_time = "00:00"
            sec_list = free_time.filter(start=start_time, end=end_time)
            if sec_list:
                sec = True
            dic = {
                "start": start_time,
                "end": end_time,
                "sec": sec,
                "tch": sec,
            }
            dates.append(dic)
    return gen_resp(0, "成功", data=dates)


def post_time(request):
    """
        保存教师上课时间
    :param request:
    :return:
    """
    user = request.user
    data = request.json
    try:
        FreeTime.objects.filter(tch=user, date=data[0]['date']).delete()
    except:
        pass
    for i in data:
        FreeTime.objects.get_or_create(tch=user, date=i['date'], start=i['start'], end=i['end'])

    return gen_resp(0, "成功", data=1)


import datetime


def tch_time(request):
    """
    选择老师
    :param request:
    :return:
    """
    start_date = datetime.date.today()
    start_time = datetime.datetime.now().strftime('%H:%M:%S')

    page = int(request.GET.get('page')) if request.GET.get('page') else 1

    NUM_PER_PAGE = 8
    print(start_date,"start_date")
    free_time = FreeTime.objects.filter(date__gte=start_date, status=0).order_by("date", "start")[
                (page - 1) * NUM_PER_PAGE: page * NUM_PER_PAGE]
    print(free_time,"====free_time")
    data = []
    for i in free_time:
        if True:
            dic = {}
            tch = {}
            tch['avatar'] = i.tch.avatar.url
            tch['name'] = i.tch.name or i.tch.wx_name
            tch['id'] = i.tch.id
            dic['tch'] = tch

            dates = str(i.date).split('-')
            dic['dates'] = dates[1] + '-' + dates[2]
            dic['date'] = i.date
            starts = str(i.start).split(':')
            dic['start'] = starts[0] + ":" + starts[1]
            dic['id'] = i.id
            data.append(dic)

    data.sort(key=itemgetter('date'), reverse=False)
    log.info(data)
    return gen_resp(0, "成功", data=data)


class Suborder(View):
    """拼课订单"""

    def post(self, request):
        """
        生成拼课订单
        :param request:
        :return:
        """
        user = request.user
        data = request.json
        log.info("请求参数:==============>>>>>" + str(data))
        # 订单号
        oid = gen_order_no(user.id)

        freetime = FreeTime.objects.get(id=data['freetime'])
        freetime_date = freetime.date
        freetime_time = freetime.start
        subtime = datetime.datetime(freetime_date.year, freetime_date.month, freetime_date.day, freetime_time.hour,
                                    freetime_time.minute)
        order = Order.objects.create(oid=oid, sub_id=data['sub_id'], list_id=data['list_id'], user=user,
                                     teacher_id=data['tch_id'],
                                     time_id=data['freetime'], sub_time=subtime, price=float(data['price']),
                                     team_type=data['status'])

        log.info(model_2_dict(order))
        with transaction.atomic():
            # 增加筛选条件
            if 'status' in data and data['status'] == '1':

                if 'sex' in data['arr']:
                    sex = data['arr']['sex']
                    # 存筛选条件
                    SearchType.objects.create(ord=order, type=1, value=sex)
                if 'level' in data['arr']:
                    level = data['arr']['level']
                    # 存筛选条件
                    SearchType.objects.create(ord=order, type=2, value=level)
                if 'age_end' in data['arr']:
                    age_first = data['arr']['age_first']
                    age_end = data['arr']['age_end']
                    # 存筛选条件
                    SearchType.objects.create(ord=order, type=3, value=str(age_first) + '-' + str(age_end))

            # 改变上课时间状态
            freetime = FreeTime.objects.get(id=data['freetime'])
            freetime.status = 1
            freetime.save()
            # 增加销量
            list = List.objects.get(id=data['list_id'])
            list.sale += 1
            list.save()
            # 交易记录
            Balance.objects.create(user=user.id, num=data['price'])

            # 会员卡课时余额
            corder_obj = COrder.objects.filter(userId=user.id, status=1)
            corder = corder_obj.first()
            if float(corder.have) >= float(data['price']):
                corder.have = float(corder.have) - float(data['price'])
                corder.save()
            else:
                # 第二张会员卡
                corder_end = corder_obj[1]
                have = float(corder_end.have) - float(data['price']) + float(corder.have)
                corder_end.have = have
                corder_end.save()

                # 第一张会员卡 清零
                corder.have = 0
                corder.status = 2
                corder.save()

        return gen_resp(0, "成功", data=order.id)

    def get(self, request):
        """
        查询下单前
        :param request:
        :return:
        """
        user = request.user
        data = request.GET.dict()

        dic = {}
        # 目录
        if "list_id" in data:
            list = List.objects.get(id=data['list_id'])
            lists = {}
            lists['main'] = list.sub.main.url
            lists['name'] = list.sub.name
            lists['sub_id'] = list.sub.id
            lists['title'] = list.name
            lists['price'] = list.price
            if data['status'] == '2':
                lists['price'] = list.price + (list.price / 2)
            lists['sort'] = list.sub.sort.name
            dic['title'] = lists
        # 上课时间
        if "freetime" in data:
            free_time = FreeTime.objects.get(id=data['freetime'])
            tch = {}
            tch['id'] = free_time.tch.id
            tch['avatar'] = free_time.tch.avatar.url
            tch['name'] = free_time.tch.name or free_time.tch.wx_name
            tch['content'] = free_time.tch.content or ''
            dic['tch'] = tch
        if "id" in data:
            pass
        else:
            users = []
            user_dic = {}
            user_dic['avatar'] = free_time.tch.avatar.url
            user_dic['name'] = free_time.tch.name or free_time.tch.wx_name
            user_dic['content'] = free_time.tch.content or ''
            users.append(user_dic)
            dic['user'] = users
        # 返回余额
        # balance = Balance.objects.filter(user=user.id).aggregate(Sum('num'))
        # money = balance['num__sum']
        corder = COrder.objects.filter(userId=user.id, status=1).aggregate(Sum('have'))
        money = corder['have__sum']
        log.info(money)
        dic['money'] = money
        return gen_resp(0, "成功", data=dic)


def add_team(request):
    """
    加入组队
    :param request:
    :return:
    """
    user = request.user
    id = request.GET.get('id')

    order = Order.objects.get(id=id)
    send = [user, order.user]
    if order.status == 0 and not order.partner:  # 拼课中且无伙伴
        search = True
        if search:
            # 订单状态-拼课成功
            status = 1
            # 添加伙伴
            order.partner = user
            # 改变状态
            order.status = status
            order.save()
            # 支付金额
            pay = order.price / 2  # 特定邀请
            if order.team_type < 2:  # 其他邀请
                pay = order.price

            # 生成订单
            dic = {}
            dic['sub'] = order.sub
            dic['list'] = order.list
            dic['user'] = user
            dic['partner'] = order.user
            dic['teacher'] = order.teacher
            dic['time'] = order.time
            dic['status'] = status
            dic['team_type'] = order.team_type
            dic['price'] = pay
            dic['oid'] = order.oid
            Order.objects.create(**dic)
            # 交易记录
            Balance.objects.create(user=user.id, num=pay)

            # 会员卡课时余额
            corder_obj = COrder.objects.filter(userId=user.id, status=1)

            corder = corder_obj.first()
            if float(corder.have) >= float(pay):
                corder.have = float(corder.have) - float(pay)
                corder.save()
            else:
                # 第二张会员卡
                corder_end = corder_obj[1]
                have = float(corder_end.have) - float(pay) + float(corder.have)
                corder_end.have = have
                corder_end.save()

                # 第一张会员卡 清零
                corder.have = 0
                corder.status = 2
                corder.save()

                #     拼课成功，发送订阅消息，组队成功通知
                datamsg = {
                    "thing1": {"value": order.list.name + "(" + order.sub.name + ")"},
                    "phrase2": {"value": "已成功"}
                }
                send_subscribe_msg(
                    user.openid,
                    "PBAz7gC7tdcG2Kr1reuV2TVtP4YAiMcem_4lf0PZpgg",
                    datamsg
                )

            return gen_resp(0, "成功", data=1)
        return gen_resp(0, "未满足条件", data=1)

    log.info(model_2_dict(order))
    return gen_resp(1, "组队失败", data=order.status)


def tch_sub(request):
    """
    教师端-我的课程
    :param request:
    :return:
    """
    user = request.user
    id = request.GET.get('id')

    now = datetime.datetime.now()
    #
    # # 过期数据
    # Order.objects.filter(status=1, time__date=now.date(), time__start__lt=now.time()).update(
    #     status=6)
    # Order.objects.filter(status=1, time__date__lt=now.date()).update(
    #     status=6)
    # # -------
    order = Order.objects.filter(status=id, teacher=user.id).order_by("-time")
    old_team = []
    for s in order:
        sub_item = model_2_dict(s)
        sub_item['sub'] = model_2_dict(s.sub)
        sub_item['list'] = model_2_dict(s.list)
        sub_item['list']['hour'] = str(int(s.list.time / 60)) + "小时" + str(int(s.list.time % 60)) + '分钟'
        sub_item['sub']['sort'] = s.sub.sort.name
        # 开课时间
        sub_item['time'] = model_2_dict(s.time)

        date = s.time.date
        time = s.time.start
        da = str(date).split('-')
        tm = str(time).split(':')
        sub_item['times'] = datetime.datetime(int(da[0]), int(da[1]), int(da[2]), int(tm[0]), int(tm[1]), 0)
        old_team.append(sub_item)
    a = sorted(old_team, key=lambda x: x['times'], reverse=False)
    new_dic = {}
    for item in old_team:
        oid = item.get('oid')
        if not new_dic.get(oid):
            new_dic[oid] = [item]
        else:
            new_dic[oid].append(item)
    new_list = []
    for k, v in new_dic.items():
        new_list.append(v)
    return gen_resp(0, "成功", data=new_list)


def tch_me(request):
    """
    教师端-我的资料
    :param request:
    :return:
    """
    user = request.user
    return gen_resp(0, "成功", data=1)


def user_list(request):
    """
    用户列表
    :param request:
    :return:
    """
    user = request.user
    data = request.GET.dict()
    page = int(data['page'])
    NUM_PER_PAGE = 10
    krag = {}
    if "sex" in data:
        krag['sex'] = True if data['sex'] == 'true' else False
    if "ages" in data:
        year = datetime.datetime.now().year
        if data['ages'] == "50岁以上":
            krag['birth__year__lte'] = year - 50
        else:
            age = data['ages'].replace('岁', '').split('-')
            krag['birth__year__lte'] = year - int(age[0])
            krag['birth__year__gte'] = year - int(age[1])
    # 学历
    if 'edu' in data:
        krag['edu'] = data['edu']
    # 职业
    if 'occ' in data:
        krag['ocp'] = data['occ']
    # 英语水平
    if 'eng_level' in data:
        krag['wsk'] = data['eng_level']
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(data))
    log.info("'\r\n''\r\n'筛选参数------------->>>>'\r\n'" + str(krag))
    user_obj = User.objects.filter(~Q(avatar="")).filter(**krag)[(page - 1) * NUM_PER_PAGE: page * NUM_PER_PAGE]

    # 查询发出邀请记录
    send_obj = Send.objects.filter(order=data['id'], user=user.id)
    list = []
    for i in user_obj:

        try:

            dic = {}
            dic['send'] = True if send_obj.filter(send=i.id) else False
            dic['avatar'] = i.avatar.url if i.avatar else None
            dic['id'] = i.id
            dic['sex'] = i.sex
            dic['age'] = datetime.datetime.now().year - i.birth.year if i.birth else '未知'

            dic['ocp'] = i.ocp
            dic['ocp_display'] = i.get_ocp_display() if i.ocp else '未知'
            dic['edu'] = i.edu
            dic['edu_display'] = i.get_edu_display() if i.edu else '未知'
            dic['city'] = i.city if i.city else '未知'
            dic['wsk'] = i.wsk
            dic['wsk_display'] = i.get_wsk_display() if i.wsk else '未知'
            dic['sign'] = i.sign if i.sign else '暂无签名'
            dic['name'] = i.name if i.name else i.wx_name
            list.append(dic)
        except:
            pass

    # 课程图片名字
    sub = model_2_dict(Order.objects.get(id=data['id']).sub)

    return gen_resp(0, "成功", data=list, sub=sub)


def seed(request):
    """
    发出好友邀请
    :param request:
    :return:
    """
    user = request.user
    r_id = request.GET.get('r_id')  # 被邀请者id
    id = request.GET.get('id')  # 订单id
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(request.GET.dict()))
    openid = User.objects.get(id=int(r_id)).openid

    # 发送模版消息>>>>>>>好友邀请通知
    Send.objects.get_or_create(order=id, user=user.id, send=r_id)
    # 订单
    order = Order.objects.get(id=id)
    # 授课邀请提醒
    vals = [order.list.name + "(" + order.sub.name + ")", "快去看看吧～", ]
    data = {f'thing{i+1}': {'value': v} for i, v in enumerate(vals)}
    seed = send_subscribe_msg(
        openid,
        "jSI1BfHpkO5op4N3gEt6-ehBY3z9riQMx4c2XSIaCHg", data,
        'pages/teamdetail/teamdetail?id=' + id
    )

    log.info("'\r\n''\r\n'订阅消息------------->>>>'\r\n'" + str(seed))
    return gen_resp(0, "成功", data=1)


def cash_out(request):
    """
    提现申请
    :param request:
    :return:
    """
    user = request.user
    return gen_resp(0, "成功", data=1)


def relation(request):
    """
    用户关系
    """
    req = request.GET.dict()
    u_id = req['userId']
    reference = req['reference']
    if len(Relation.objects.filter(u_id=req['userId'])) == 0 and reference != u_id:
        Relation.objects.create(u_id_id=u_id, reference_id=reference)
    return gen_resp(0, '成功')


def drop(request):
    """
    退课
    :param request:
    :return:
    """
    user = request.user
    data = json.loads(request.body)
    data, rsp = clear_data(data, must=['id'])
    order = Order.objects.get(id=data['id'])
    send = [user, ]  # 下发模版消息的用户们
    if order.status == 1 or order.status == 0:

        with transaction.atomic():

            # 改变订单状态
            order.status = 4
            order.save()
            # 返还课时
            corder = COrder.objects.filter(userId=user.id, status=1).first()
            corder.have = corder.have + order.price
            corder.save()
            # 交易记录
            Balance.objects.create(user=user.id, num=order.price)

            # 释放教师上课时间
            freetime = FreeTime.objects.get(id=order.time.id)
            freetime.status = 0
            freetime.save()

            # 销量回滚
            list = List.objects.filter(sub=order.sub.id).first()
            num = 1
            # 如果伙伴存在,则返还伙伴课时

            if order.partner:
                num = 2
                p_order = Order.objects.filter(oid=order.oid, user=order.partner.id).first()
                # 改变订单状态
                p_order.status = 4
                p_order.save()
                # 返还课时
                p_corder = COrder.objects.filter(userId=order.partner.id, status=1).first()
                p_corder.have = p_corder.have + p_order.price
                p_corder.save()
                # 交易记录
                Balance.objects.create(user=order.partner.id, num=p_order.price)
                send.append(order.partner)
            list.sale = list.sale - num
            list.save()
        #     退课成功，发送模版消息，成员退出通知
        try:

            for s in send:
                datamsg = {
                    "name1": {'value': s.name if s.name else s.wx_name},
                    'date3': {'value': datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')},
                    'thing2': {'value': "课时已返还到你的余额～"},

                }
                send_subscribe_msg(
                    user.openid,
                    "bk0yliP93QhNDDUExbNKVHDqMK4dnIB3BydkvHeoXnw",
                    datamsg,
                    'pages/home/home',
                )
        except:
            pass
        return gen_resp(0, "成功", data=1)
    else:
        return gen_resp(1, "退课失败，该订单状态不可退，请联系客服处理")


@require_POST
def formid(request):
    """
    创建小程序模板消息formid
    /formid
    {formids: []}
    """
    user = request.user
    if not isinstance(user, User):
        return gen_resp(Code.ILLEGAL)

    fids = request.json.get('formids')
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(fids))
    if not fids:
        return gen_resp(Code.PARAM_MISS, 'formids')
    try:
        FormId.objects.bulk_create([FormId(user=user, formid=fid) for fid in fids])
        return gen_resp(msg='创建成功')
    except Exception as err:
        log.error(str(err))
        return gen_resp(2, str(err))


def classin(request):
    """
    classin 账号
    :param request:
    :return:
    """
    user = request.user
    ua = UAccount.objects.filter(user=user.id).first()
    return gen_resp(0, "成功", data=model_2_dict(ua))


def complain(request):
    """
    投诉
    :param request:
    :return:
    """
    user = request.user
    data = json.loads(request.body)

    krg = {"user_id": user.id}
    if 'content' in data:
        krg['content'] = data['content']
    if 'oid' in data:
        krg['oid'] = data['oid']
    if 'labels' in data:
        krg['label'] = data['labels']
    order = Order.objects.get(id=data['oid'])
    if order.status == 5:
        return gen_resp(1, "已经投诉过啦～", data=1)
    with transaction.atomic():
        Complain.objects.create(**krg)
        # 改变订单状态
        order.status = 5
        order.save()
    return gen_resp(0, "成功", data=1)


def classok(request):
    """
    确认上课
    :param request:
    :return:
    """
    user = request.user
    data = json.loads(request.body)
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(data))

    order = Order.objects.get(id=data['id'])
    with transaction.atomic():
        order.status = 2
        order.save()

        # 检测两个人寸不存在用户关系
        inv = Invite.objects.filter(parnter=order.partner.id, user=user.id)

        if inv and inv[0].task3_type == 0:
            # 计算两个人的上课次数
            sum = len(Order.objects.filter(user=user.id, partner=order.partner.id, status=2))
            if sum >= 6:
                nonce_str = rand_str(12)
                COrder.objects.create(orderNo=nonce_str, have=1, userId=user.id, status=1, fee=0)
                COrder.objects.create(orderNo=nonce_str, have=1, userId=order.partner.id, status=1, fee=0)
                inv.update(task3_type=1, task3=True)

        if inv:
            inv.update(task1=True, task1_type=1)
    return gen_resp(0, "成功", data=1)


def balance(request):
    """
    课时余额查询
    :param request:
    :return:
    """
    user = request.user
    have = COrder.objects.filter(status=1, userId=user.id).aggregate(Sum('have'))['have__sum']
    return gen_resp(0, "成功", data=have)


def check(request):
    """
    检测是否满足拼课条件
    :param request:Invite
    :return:
    """
    user = request.user
    o_id = request.GET.get('id')
    search = SearchType.objects.filter(ord=o_id)

    for s in search:

        if s.type == 1:
            if s.value == str(user.sex):
                pass
            else:
                return gen_resp(0, data=False)

        if s.type == 2:
            if int(s.value) == user.wsk:
                pass
            else:

                return gen_resp(0, data=False)
        if s.type == 3:
            year = datetime.datetime.now().year - user.birth.year
            section = s.value.split('-')
            if year > int(section[0]) and year < int(section[1]):
                pass
            else:
                return gen_resp(0, data=False)

    return gen_resp(0, data=True)


def comment(request):
    """
    评价
    :param request:
    :return:
    """
    user = request.user
    data = json.loads(request.body)
    type = data['type'] if 'type' in data else 0
    if type == 1 or type == '1':
        order = Order.objects.filter(oid=data['oid'], teacher=user)
    else:
        order = Order.objects.filter(oid=data['oid'], user=user)

    with transaction.atomic():
        comments, create = Comment.objects.get_or_create(sub_id=order[0].sub.id, list=order[0].list, user=user,
                                                         oid=order[0].oid, type=type)

        comments.comment = data['content']
        comments.tch_star = data['tch_star'] if data['tch_star'] else 5
        comments.sub_star = data['sub_star'] if data['sub_star'] else 5
        comments.save()

        # 改变订单状态
        if type == 1 or type == '1':
            order.update(tcmted=True)
        else:
            order.update(ucmted=True)
    return gen_resp(0, 1)


def addfriend(request):
    """
    申请成为好友
    :param request:
    :return:
    """
    user = request.user
    id = request.GET.get('id')
    type = request.GET.get('type') or '1'
    log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(request.GET.dict()))

    # 申请成为好友
    if type == '1':
        be, create = Befriend.objects.get_or_create(user=user.id, parnter=id)

        be.type = type
        be.save()
        # 发送申请通知 ？》》》》》访问申请通知
        openid = User.objects.get(id=id).openid
        datamsg = {
            "thing1": {"value": user.name or user.wx_name},
            "thing2": {"value": '对方想和您成为学习搭档，赶快进去看看吧～'},

        }
        send = send_subscribe_msg(
            openid,
            "tCwHx01TMCS6xnOxnO4ovVyw8orTfLYt0bfWVmvjNc8",
            datamsg,
            'pages/partner/partner',
        )

    # 同意/ 拒绝
    if type == '2' or type == '3':
        with transaction.atomic():
            be, create = Befriend.objects.get_or_create(user=id, parnter=user.id)
            be.type = type
            be.save()
            if type == '2':
                # 发送申请通知 ？》》》》》同意沟通提醒
                datamsg = {
                    "thing1": {"value": user.name or user.wx_name},
                    "thing2": {"value": '对方同意与您成为学习搭档，赶快进去看看吧～'},

                }
                try:
                    send = send_subscribe_msg(
                        openid,
                        "tCwHx01TMCS6xnOxnO4ovVyw8orTfLYt0bfWVmvjNc8",
                        datamsg,
                        'pages/partner/partner',
                    )
                except:
                    pass

                Befriend.objects.get_or_create(user=user.id, parnter=id, type=2)
            if type == '3':
                # 发送申请通知 ？》》》》》拒绝申请通知
                datamsg = {
                    "thing1": {"value": user.name or user.wx_name},
                    "thing2": {"value": '对方拒绝与您成为学习搭档～'},

                }
                send = send_subscribe_msg(
                    openid,
                    "tCwHx01TMCS6xnOxnO4ovVyw8orTfLYt0bfWVmvjNc8",
                    datamsg,
                    'pages/partner/partner',
                )
    return gen_resp(0, 1)


def invite(request):
    """
    用户关系绑定。
    :param request:
    :return:
    """
    user = request.user
    uid = request.GET.get('uid')

    inv = Invite.objects.filter(parnter=int(uid))

    if not inv and uid != user.id:
        Invite.objects.create(user=user.id, parnter_id=int(uid))
    return gen_resp(0, 1)


def get_uid(request):
    """
    获取userid
    :param request:
    :return:
    """
    u_id = request.user.id
    # 查看用户有没领取新人礼包
    c = COrder.objects.filter(card_id=None, userId=u_id, )

    gift = True if c else False
    data = {
        'gift': gift,
        'u_id': u_id
    }
    return gen_resp(0, data=data)


def getgift(request):
    """
    领取礼包
    :param request:
    :return:
    """
    user = request.user
    nonce_str = rand_str(12)
    c = COrder.objects.filter(card=None, userId=user.id, )
    # 如果没有领取新人礼包
    if not c:
        COrder.objects.create(orderNo=nonce_str, have=1, userId=user.id, status=1, fee=0)

    return gen_resp(0, 111)


def tch_cashout(request):
    """
    教师可提现课时，和累计课时
    :param request:
    :return:
    """
    user = request.user
    order = Order.objects.filter(Q(status=2) | Q(status=6), teacher=user.id)
    ke = order.filter(Q(cashout=0) | Q(cashout=None)).aggregate(Sum('price'))['price__sum']
    all = order.aggregate(Sum('price'))['price__sum']
    data = {
        'ke': ke if ke else 0,
        'all': all
    }
    return gen_resp(0, data=data)


def beout(request):
    """
    提现申请
    :param request:
    :return:
    """
    user = request.user
    order = Order.objects.filter(Q(status=2) | Q(status=6), teacher=user.id, ).filter(Q(cashout=0) | Q(cashout=None))
    ke = order.aggregate(Sum('price'))['price__sum']
    with transaction.atomic():
        tch_apply = TchbeOut.objects.create(tch=user, kes=ke, )
        order.update(cashout=1, cash_id=tch_apply.id)
    return gen_resp(0, '成功')


def cashout(request):
    """
    提现列表
    :param request:
    :return:
    """
    user = request.user
    status = request.GET.get('status')
    tchbeout = TchbeOut.objects.filter(tch=user, type=status, )

    return gen_resp(0, '成功', data=[model_2_dict(i) for i in tchbeout])


def video(request):
    """
    视频
    :param request:
    :return:
    """
    id = request.GET.get('id')
    vo = Video.objects.get(id=id)
    return gen_resp(0, '成功', data=vo.file.url)


def share(request):
    """
    邀请好友列表
    :param request:
    :return:
    """
    user = request.user
    data = []
    for i in Invite.objects.filter(user=user.id):
        dic = model_2_dict(i)
        money = 0

        if i.task1:
            money += 10
        if i.task2:
            money += int(i.fee) * 0.1
        dic['money'] = money
        dic['parnter'] = model_2_dict(i.parnter)
        data.append(dic)
    return gen_resp(0, '成功', data=data)


def user_money(request):
    """
        用户可提现金额
        :param request:
        :return:
        """
    user = request.user
    # 查看可提现金额
    inv = Invite.objects.filter(user=user.id)
    money = 0
    if inv:
        for i in inv:

            if i.task1_type and i.task1_type == 1:
                money += 10
            if i.task2_type and i.task2_type == 1:
                money += float(i.fee) * 0.1
    return gen_resp(0, '成功', data=money)


def user_cashout(request):
    """
    用户提现
    :param request:
    :return:
    """
    user = request.user
    nonce_str = rand_str(12)
    # 查看可提现金额
    inv = Invite.objects.filter(user=user.id)
    money = 0
    for i in inv:
        if i.task1_type == 1:
            money += 10
        if i.task2_type == 1:
            money += float(i.fee) * 0.1

    cert = ('/home/aek/group/cert/cert.pem',
            '/home/aek/group/cert/key.pem')
    try:
        pay = pay_user(user.openid, money * 100, nonce_str, "47.110.13.254", cert)
        log.info("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(pay))
        return gen_resp(1, "成功")
    except Exception as e:
        log.error("'\r\n''\r\n'请求参数------------->>>>'\r\n'" + str(e))
        return gen_resp(1, "失败")


def platform(request):
    """
    平台管理
    :param request:
    :return:
    """
    try:
        ptm = model_2_dict(Platform.objects.all()[0])
        return gen_resp(0, "成功", data=ptm)
    except:
        return gen_resp(1, "失败")
