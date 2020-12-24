# -*- coding: utf-8 -*-
# @Time    : 2019/8/20 4:16 PM
# @Author  : Zhengqi
from django.utils.safestring import mark_safe


def to_img(w, h, url):
    """

    admin显示图片

    :param w: 图片宽度
    :param h: 图片高度
    :param url: 地址
    :return:
    """
    return mark_safe(
        '<a style="height:{0}px;width:{1}px;" harf="{2}">'
        '<img style="height:{0}px;width:{1}px;" src="{2}" /></a>'.format(w, h, url))
