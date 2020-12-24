# -*- coding: utf-8 -*-
# @Time    : 2019/8/13 6:22 PM
# @Author  : Zhengqi

from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^platform/', platform),                      # 平台管理
    url(r'^login/', login),                            # 登陆
    url(r'^ready/', ready),  # 查看有没有礼物
    url(r'^mytch/', mytch),                            # 教师列表
    url(r'^home/', home),                              # 首页
    url(r'^sort/', sort),                              # 获取分类，拼课页面
    url(r'^sub_list/', sub_list),                      # 首页课程
    url(r'^sub_detail/', sub_detail),                  # 课程详情
    url(r'^teacher_list/', teacher_list),              # 课程详情
    url(r'^phone/', phone),                            # 获取手机号
    url(r'^land/', land),                              # 获取微信用户信息
    url(r'^UserInfo/', UserInfo.as_view()),            # 用户表相关操作
    url(r'^industry/', industry),                      # 行业列表
    url(r'^card/', card),                              # 会员列表
    url(r'^pay/', order_pay),                          # 获取支付参数
    url(r'^put_order/', put_order),                    # 改变订单状态，暂时用
    url(r'^mycard/', mycard),                          # 我的会员卡
    url(r'^my_study/', my_study),                      # 我的学习
    url(r'^last_learn/', last_learn),                  # 最近在学
    url(r'^team_record/', team_record),                # 拼课记录
    url(r'^sign_record/', sign_record),                # 报名记录
    url(r'^balance/', balance),                        # 课时余额查询
    url(r'^check/', check),                            # 检测是否满足拼课条件
    url(r'^partner/', partner),                        # 学习搭档
    url(r'^apply/', apply),                            # 申请教师
    url(r'^apply_record/', apply_record),               # 申请教师记录
    url(r'^tch_time/', tch_time),                      # 教师列表
    url(r'^suborder/', Suborder.as_view()),            # 生成课程订单
    url(r'^order/', order),                            # 请求拼课列表
    url(r'^order_detail/', order_detail),              # 拼课详情
    url(r'^add_team/', add_team),                      # 加入组队
    url(r'^user_list/', user_list),                    # 用户列表
    url(r'^cash_out/', cash_out),                      # 提现申请
    url(r'^relation/', relation),                      # 用户关系
    url(r'^drop/', drop),                              # 退课
    url(r'^formid/', formid),                          # 存formid
    url(r'^classin/', classin),                        # 请求classin账号
    url(r'^complain/', complain),                      # 投诉
    url(r'^classok/', classok),                         # 确认上课
    url(r'^seed/', seed),                              # 发出邀请
    url(r'^comment/', comment),                         # 评价
    url(r'^addfriend/', addfriend),                     # 好友申请
    url(r'^invite/', invite),                           # 用户关系绑定
    url(r'^get_uid/', get_uid),                         # 获取userid
    url(r'^getgift/', getgift),                         # 领取礼包
    url(r'^share/', share),                          # 邀请好友列表
    url(r'^user_money/', user_money),               # 用户可提现金额
    url(r'^user_cashout/', user_cashout),               # 用户提现


    url(r'^sub_time', sub_time),                       # 上课时间
    url(r'^post_time', post_time),                     # 保存上课时间
    url(r'^tch_sub', tch_sub),                         # 教师端-我的课程
    url(r'^tch_cashout', tch_cashout),                  # 教师端-提现
    url(r'^tch_me', tch_me),                           #  教师端-我的资料
    url(r'^beout', beout),                           # 教师端-提现申请
    url(r'^cashout', cashout),                      # 教师端-提现列表





    url(r'^video', video),                          # 视频
    url('qiniu_token/', qiniu_token),               # 获取千牛token
    url('pay_noti/', pay_noti),                     # 支付回调

]
