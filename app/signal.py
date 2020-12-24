# -*- coding: utf-8 -*-
# @Time    : 2019/9/8 11:46 AM
# @Author  : Zhengqi
from django.dispatch import receiver
from django.db.models.signals import post_save, post_migrate, pre_save
from app.models import Apply, User, FormId, Complain, Order, TchbeOut
from utils.wxtool import send_mini_tpl_msg,send_subscribe_msg
import logging

log = logging.getLogger()


@receiver(post_save, sender=Apply, dispatch_uid="Apply_post_save")
def apply_signal(sender, instance=None, created=True, **kwargs):
    """
    教师申请信号量
    审核通过改变用户身份
    :param instance:
    :param created:
    :return:
    """
    send = "formid不存在"
    user = User.objects.get(id=instance.user.id)
    if instance.status == 2:
        """
            审核通过
        """
        # 修改用户身份
        user.utype = 2
        user.name = instance.name
        user.content = instance.content
        user.sex = instance.sex
        user.edu = instance.edu
        user.wsk = instance.wsk
        user.mail = instance.mail
        user.phone = instance.phone
        user.save()
        # 发送审核通知
        datamsg={
            "thing1":{"value":"恭喜您已成为我们的教师"},
            "thing3":{'value':"感谢您的加入"}
        }
        send = send_subscribe_msg(
            user.openid,
            "fV3I2Z3uPsnv24wNnYrqgnY6nyv07vnKJnM7VvDF46M",
           datamsg,
            'pages/home/home',
        )

        send = str(send)
    if instance.status == 1:
        # 修改用户身份
        user.utype = 1
        user.save()
        # 发送审核通知
        datamsg = {
            "thing1": {"value": "平台拒绝你的申请"},
            "thing3": {'value':  instance.cause}
        }
        send = send_subscribe_msg(
            user.openid,
            "fV3I2Z3uPsnv24wNnYrqgnY6nyv07vnKJnM7VvDF46M",
            datamsg,
            'pages/home/home',
        )


        send = str(send)
    log.info("'\r\n''\r\n'发送审核通知----------->>>>>>>" + send)


@receiver(post_save, sender=Complain, dispatch_uid="complain_post_save")
def complain_signal(sender, instance=None, created=True, **kwargs):
    """
    订单投诉信号量
    审核通过改变用户身份
    :param instance:
    :param created:
    :return:
    """
    # 同意投诉申请
    if instance.status == 2:
        Order.objects.filter(id=instance.oid, status=5).update(status=4)


@receiver(post_save, sender=TchbeOut, dispatch_uid="TchbeOut_post_save")
def TchbeOut_signal(sender, instance=None, created=True, **kwargs):
    """
    教师提现申请
    审核通过改变订单状态
    :param instance:
    :param created:
    :return:
    """
    # 同意打款
    if instance.type == 1:
        Order.objects.filter(cash_id=instance.id).update(cashout=2)
    # 拒绝打款
    if instance.type == 2:
        Order.objects.filter(cash_id=instance.id).update(cashout=3)
