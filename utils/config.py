# -*- coding: utf-8 -*-
# @Time    : 2019/8/13 5:31 PM
# @Author  : Zhengqi


"""
    小程序相关配置(配置自己的)
"""
ID = "${appid}"
KEY = "${key}"

MCH_KEY = '${MCH_KEY}'
MCH_ID = '${MCH_ID}'

HOST_URL = '${HOST_URL}'
NOTI_URL = '${NOTI_URL}'

"""
    七牛云相关配置
    386648547@qq.com
"""
QINIU_ACCESS_KEY = '${QINIU_ACCESS_KEY}'
QINIU_SECRET_KEY = '${QINIU_SECRET_KEY}'
QINIU_BUCKET_NAME = '${QINIU_BUCKET_NAME}'
QINIU_BUCKET_DOMAIN = '${url}'
QINIU_SECURE_URL = False  # 使用http
PREFIX_URL = 'http://'
DEFAULT_FILE_STORAGE = '${DEFAULT_FILE_STORAGE}'

#  媒体文件保存
MEDIA_URL = PREFIX_URL + QINIU_BUCKET_DOMAIN + '/'
MEDIA_ROOT = ''

"""
    admin jet 相关配置
"""

JET_SIDE_MENU_COMPACT = True  # 是否展开所有菜单

LANGUAGE_CODE = 'zh-hans'  # 界面汉化
TIME_ZONE = 'Asia/Shanghai'

JET_SIDE_MENU_ITEMS = {  # 列表配置
    'admin': [
        {'label': '平台管理', 'app_label': 'app', 'items': [
            {'name': 'platform'},
        ]},
        {'label': '用户管理', 'app_label': 'app', 'items': [
            {'name': 'user'},
            {'name': 'apply'},
        ]},
        {'label': '小程序管理', 'app_label': 'app', 'items': [
            {'name': 'banner'},
            {'name': 'industry'},
        ]},
        {'label': '课程管理', 'app_label': 'app', 'items': [
            {'name': 'sort'},
            {'name': 'subject'},
            {'name': 'complain'}
        ]},
        {'label': '会员卡管理', 'app_label': 'app', 'items': [
            {'name': 'card'},
        ]},
        {'label': '订单管理', 'app_label': 'app', 'items': [
            {'name': 'order'},
            {'name': 'corder'},
        ]},
        {'label': '评价管理', 'app_label': 'app', 'items': [
            {'name': 'comment'},
        ]},
        {'label': '分销管理', 'app_label': 'app', 'items': [
            {'name': 'invite'},
        ]},

        {'label': '投诉管理', 'app_label': 'app', 'items': [
            {'name': 'complain'}
        ]},
        {'label': '提现申请', 'app_label': 'app', 'items': [
            {'name': 'tchbeout'}
        ]},
        {'label': '视频管理', 'app_label': 'app', 'items': [
            {'name': 'video'}
        ]},
    ]
}

JET_THEMES = [
    {
        'theme': 'default',  # theme folder name
        'color': '#47bac1',  # color of the theme's button in user menu
        'title': 'Default'  # theme title
    },
    {
        'theme': 'green',
        'color': '#44b78b',
        'title': 'Green'
    },
    {
        'theme': 'light-green',
        'color': '#2faa60',
        'title': 'Light Green'
    },
    {
        'theme': 'light-violet',
        'color': '#a464c4',
        'title': 'Light Violet'
    },
    {
        'theme': 'light-blue',
        'color': '#5EADDE',
        'title': 'Light Blue'
    },
    {
        'theme': 'light-gray',
        'color': '#222',
        'title': 'Light Gray'
    }
]
