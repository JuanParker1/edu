import hmac
import base64
import datetime
import requests
import random
import string

from urllib.parse import quote, urlencode


class AliYunSMS:
    """
    阿里云短信
    """
    def __init__(self, key_id, key_secret, region, sign_name):
        self.key = key_id
        self.secret = key_secret + "&"
        self.region = region
        self.sign_name = sign_name

        self.action = ""

    def clear(self, src):
        src = src.replace('+', '%20')
        src = src.replace('*', '%2A')
        src = src.replace('%7E', '~')
        return src

    def get_sign(self, data):
        src = urlencode(sorted(list(data.items())))
        # GET是请求方法
        src = 'GET&%2F&'+quote(self.clear(src), safe='~')
        h = hmac.new(self.secret.encode(), src.encode(), 'sha1')
        return str(base64.encodebytes(h.digest()).strip(), "utf-8")

    def send_sms(self, phone, code, tplid):
        self.action = "SendSms"
        data = {
            "Format": "JSON",
            "Version": "2017-05-25",
            "AccessKeyId": self.key,
            "SignatureMethod": "HMAC-SHA1",
            "SignatureVersion": "1.0",
            "SignatureNonce": ''.join(random.sample(string.digits+string.ascii_letters, 12)),
            "Timestamp": datetime.datetime.utcnow().isoformat("T"),
            "RegionId": self.region,
            "Action": self.action,
            "SignName": self.sign_name,
            "TemplateCode": tplid,
            "PhoneNumbers": phone,
            "TemplateParam": '{"code":"'+str(code)+'"}'
        }

        data['Signature'] = self.get_sign(data)
        single_sms_url = 'http://dysmsapi.aliyuncs.com/?'+self.clear(urlencode(data))

        return requests.get(single_sms_url)


tanku_sms = AliYunSMS(
        key_id="",
        key_secret="",
        region='cn-',
        sign_name="织游出行"
    )


def send_sms(phone, code):
    """
    默认短信下发方法， 有新账号时需要新建更改参数
    :param phone:
    :param code:
    :return:
    """

    return tanku_sms.send_sms(phone, code, 'SMS_147085174')