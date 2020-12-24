import logging
import hashlib
import random
import string
import base64
import json
import requests
import xmltodict
# from Crypto.Cipher import AES
# from Crypto.Cipher import AES

from django.utils import timezone
from datetime import timedelta
from .config import ID, KEY, MCH_ID, MCH_KEY

log = logging.getLogger('wxtool')

MINIToken = {}  # 小程序access token
MPToken = {}  # 服务号access token


def new_access_token():
    url = 'https://api.weixin.qq.com/cgi-bin/token'
    params = {
        'grant_type': 'client_credential',
        'appid': 'wxe713317872a2d636',
        'secret': '0857789af0fcd76bbadf0d553a99e330'
    }
    response = requests.get(url, params=params)
    accesstoken = response.json().get('access_token')
    return accesstoken


def session_key(code):
    url = 'https://api.weixin.qq.com/sns/jscode2session'
    data = {
        "appid": ID,
        "secret": KEY,
        "js_code": code,
        "grant_type": "authorization_code"
    }
    res = requests.get(url, params=data)
    bytes_content = (str(res.content, encoding="utf-8"))
    content = eval(bytes_content)
    return content


class WXBizDataCrypt:
    def __init__(self, appId, sessionKey):
        self.appId = appId
        self.sessionKey = sessionKey

    def decrypt(self, encryptedData, iv):
        sessionKey = base64.b64decode(self.sessionKey)
        encryptedData = base64.b64decode(encryptedData)
        # iv = base64.b64decode(iv)
        cipher = AES.new(sessionKey, AES.MODE_CBC, iv)
        # decrypted = json.loads(self._unpad(cipher.decrypt(encryptedData)))

        # if decrypted['watermark']['appid'] != self.appId:
        #     raise Exception('Invalid Buffer')

        return None;

    def _unpad(self, s):
        return s[:-ord(s[len(s) - 1:])]


def rand_str(length=20):
    return ''.join(random.sample(string.digits + string.ascii_letters, length))


def wx_sign(data, secret):
    """
    微信签名
    :param data:
    :param secret: 签名秘钥
    :return:
    """

    src = ''
    for key in sorted(data):
        if key != 'sign' and data[key]:
            src += '{}={}&'.format(key, data[key])
    src += "key=" + secret
    sign = hashlib.md5(src.encode('utf-8')).hexdigest().upper()
    return sign


def wx_reply(msg=None):
    return xmltodict.unparse({
        "xml": {
            "return_code": "FAIL" if msg else "SUCCESS",
            "return_msg": msg
        }
    }, full_document=False)


def mini_token():
    try:
        now = timezone.now()

        if MINIToken and MINIToken['exp'] > now:
            return MINIToken['token'], None

        data = requests.post('https://api.weixin.qq.com/cgi-bin/token', params={
            'grant_type': 'client_credential',
            'appid': ID,
            'secret': KEY
        }).json()

        if 'access_token' in data:
            MINIToken.update({
                'token': data['access_token'],
                'exp': timezone.now() + timedelta(hours=1, minutes=59)
            })
            return MINIToken['token'], None
        else:
            return None, data
    except Exception as err:
        return None, err


def mp_token():
    try:
        now = timezone.now()

        if MINIToken and MINIToken['exp'] > now:
            return MINIToken['token'], None

        data = requests.post('https://api.weixin.qq.com/cgi-bin/token', params={
            'grant_type': 'client_credential',
            'appid': ID,
            'secret': KEY
        }).json()

        if 'access_token' in data:
            MINIToken.update({
                'token': data['access_token'],
                'exp': timezone.now() + timedelta(hours=1, minutes=59)
            })
            return MINIToken['token'], None
        else:
            return None, data
    except Exception as err:
        return None, err


def send_mp_tpl_msg(user, tplid, vals, url=None, appid=None, page='pages/index/index'):
    keyval = {f'keyword{i+1}': {'value': v} for i, v in enumerate(vals[2:])}
    keyval['fist'] = {'value': vals[0]}
    keyval['remark'] = {'value': vals[1]}

    data = {
        'touser': user,
        'template_id': tplid,
        'data': keyval
    }

    if url:
        data['url'] = url

    if appid:
        data['miniprogram'] = {
            'appid': appid,
            'pagepath': page
        }

    requests.post('https://api.weixin.qq.com/cgi-bin/message/template/send',
                  params={'access_token': mp_token()}, json=data)


def send_mini_tpl_msg(user, tplid, vals, formid, page='pages/home/home'):
    token, err = mini_token()
    if err:
        log.error('获取小程序token失败:%s', err)

    return requests.post('https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send',
                         params={'access_token': token},
                         json={
                             'touser': user,
                             'template_id': tplid,
                             'page': page,
                             'form_id': formid,

                             'data': {f'keyword{i+1}': {'value': v} for i, v in enumerate(vals)}
                         }).json()


def send_subscribe_msg(user, temid, data, page="pages/home/home"):
    token, err = mini_token()
    if err:
        log.error('获取小程序token失败:%s', err)

    return requests.post('https://api.weixin.qq.com/cgi-bin/message/subscribe/send',
                         params={'access_token': token},
                         json={
                             'touser': user,
                             'template_id': temid,
                             'page': page,
                             'data': data
                         }).json()


def pay_user(user, amount, tradeno, billip, cert, desc='所得收益'):  # 企业支付到个人

    data = {
        'mch_appid': ID,  # 商户账号appid
        'mchid': MCH_ID,  # 商户号
        'nonce_str': rand_str(),
        'partner_trade_no': tradeno,
        'openid': user,
        'amount': int(amount),
        'check_name': 'NO_CHECK',
        'desc': desc,
        'spbill_create_ip': billip
    }

    data['sign'] = wx_sign(data, MCH_KEY)

    xml = xmltodict.unparse({"xml": data}, full_document=False)
    rsp = requests.post('https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers',
                        data=xml.encode(), cert=cert)
    log.info('wx pay user rsp:%s %s', tradeno, rsp.content.decode(), xml)
    return xmltodict.parse(rsp.content.decode())["xml"]
