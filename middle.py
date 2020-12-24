import logging
import json
import jwt
from django.utils import timezone

from utils import gen_resp, RespData, Code

log = logging.getLogger()


class AuthMiddle(object):
    """
    计时兼异常处理, 逻辑已经放到deco里, 暂时不用
    """

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):

        # 黑名单处理

        path = str(request.path)

        # 接口关闭csrf检测
        if not path.startswith('/admin'):
            request._dont_enforce_csrf_checks = True

        # 接口token检测
        is_except_path = path.startswith('/admin') or path.startswith('/__debug__') or \
                         (path.startswith('/api/openid') and request.method == 'GET') or \
                         (path.startswith('/media') and request.method == 'GET') or \
                         (path.startswith('/api/home') and request.method == 'GET') or \
                         (path.startswith('/api/payNoti') and request.method == 'POST') or \
                         (path.startswith('/api/sub_list') and request.method == 'GET') or \
                         (path.startswith('/api/phone') and request.method == 'POST') or \
                         (path.startswith('/api/video') and request.method == 'GET') or \
                         (path.startswith('/api/login') and request.method == 'GET')
        if not is_except_path:
            start = timezone.now()
            token = request.headers.get('TOKEN')
            if not token:
                return gen_resp(Code.ILLEGAL)
            log.info('token-->%s', token)
            try:
                data = jwt.decode(token, verify=False)
                log.info('token-->%s', data)
                from app.models import User
                if 'openid' in data:
                    user = User.objects.filter(openid=data['openid']).first()

                    if not user:
                        return gen_resp(1, '用户不存在')
                else:
                    return gen_resp(1, 'token异常')
                jwt.decode(jwt=token,key=user.key,algorithms=['HS256'])
            except jwt.ExpiredSignatureError:
                return gen_resp(3, 'token已经过期')
            except Exception as e:
                log.warning(f'token异常：{e}')
                return gen_resp(msg='token异常')
            print(user,"user---")
            request.user = user

            if request.method == 'POST' and request.content_type == 'application/json':
                request.json = json.loads(request.body)

            before = ['=' * 40, request.get_raw_uri()]
            if request.content_type in ['application/xml', 'application/json']:
                before.append('body>\n' + request.body.decode())
            elif request.content_type == 'application/x-www-form-urlencoded':
                before.append('form>\n' + str(request.POST.dict()))
            log.info('\n'.join(before))

        response = self.get_response(request)

        if not is_except_path and (response['Content-Type'] in ['application/json']):
            log.info('\n'.join(['\nresp>\n' + response.content.decode(),
                                '=' * 40 + ' cost time:' + str(timezone.now() - start)]))

        return response

    # def process_exception(self, request, exception):
    #     """
    #     统一处理错误返回
    #     :param request:
    #     :param exception:
    #     :return:
    #     """
    #
    #     data = {'code': 10001, 'msg': '未知异常'}
    #
    #     if isinstance(exception, RespData):
    #         data = exception.data
    #     else:
    #         log.warning(exception)
    #
    #     return gen_resp(**data)
