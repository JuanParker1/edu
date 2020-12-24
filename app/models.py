from django.db import models


# Create your models here.


class UBase(models.Model):
    """
        用户基础表
    """
    avatar = models.ImageField('头像', blank=True, null=True, default="basicprofile.jpeg", max_length=200)
    phone = models.CharField('手机号', max_length=16, blank=True, null=True)
    birth = models.DateField('生日', blank=True, null=True)
    sex = models.BooleanField('性别', choices=((False, '女'), (True, '男')), null=True, default=None)
    name = models.CharField('姓名', null=True, max_length=20)
    wx_name = models.CharField('微信名', max_length=32, blank=True, default='AECLUB默认用户')
    mail = models.CharField('邮箱', max_length=100, blank=True, null=True)
    wx_num = models.CharField('微信号', max_length=100, null=True, blank=True)
    openid = models.CharField('openid', unique=True, max_length=32)
    key = models.CharField('接口密钥', max_length=50)  # 创建时需要默认生成
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        abstract = True


class Industry(models.Model):
    """
        行业
    """
    name = models.CharField('行业', max_length=50)

    class Meta:
        verbose_name = verbose_name_plural = '行业管理'
        db_table = 'group_industry'

    def __str__(self):
        return str(self.id)


class User(UBase):
    """
        客户表
    """
    w = (
        (0, '零基础'),
        (1, '入门级'),
        (2, '高中水平'),
        (3, '大学英语四级'),
        (4, '大学英语六级及以上')
    )
    e = (
        (0, '小学'),
        (1, '初中'),
        (2, '高中'),
        (3, '大学'),
        (4, '硕士'),
        (5, '博士'),
    )
    o = (
        (0, '工作'),
        (1, '学生'),
        (2, '个体经营/创业'),
        (3, '无业'),
    )
    hit = (
        (0, '140cm以下'),
        (1, '140~145cm'),
        (2, '146~150cm'),
        (3, '151~155cm'),
        (4, '156~160cm'),
        (5, '161~165cm'),
        (6, '166~170cm'),
        (7, '171~175cm'),
        (8, '176~180cm'),
        (9, '181~185cm'),
        (10, '186~190cm'),
        (11, '191~195cm'),
        (12, '195cm以上')
    )
    wd = (
        (0, '50kg以下'),
        (1, '51~70kg'),
        (2, '71~90kg'),
        (3, '91~110kg'),
        (4, '110kg以上')
    )
    utype = models.SmallIntegerField('用户类型', choices=(
        (1, '学生'), (2, '教师')
    ), default=1)
    sign = models.CharField('签名', null=True, blank=True, max_length=100)
    wsk = models.IntegerField('外语水平', default=0, choices=w, null=True, blank=True)
    city = models.CharField('所在城市', null=True, blank=True, max_length=30)
    edu = models.IntegerField('学历', null=True, blank=True, choices=e)
    ocp = models.IntegerField('职业', null=True, blank=True, choices=o)
    industry = models.ForeignKey(Industry, null=True, blank=True, on_delete=models.DO_NOTHING, verbose_name="行业")
    height = models.IntegerField('身高', null=True, blank=True, choices=hit, max_length=20)
    weight = models.IntegerField('体重', null=True, blank=True, choices=wd, max_length=20)
    content = models.TextField('文本介绍', null=True, blank=True)

    class Meta:
        verbose_name = verbose_name_plural = '用户管理'
        db_table = 'group_user'

    def __str__(self):
        return str(self.name if self.name else self.wx_name)


class UserDetail(models.Model):
    """
        用户详情
    """
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户', related_name="UserDetail")
    image = models.ImageField('图片', null=True, blank=True)

    class Meta:
        verbose_name = verbose_name_plural = '用户详情'
        db_table = 'group_user_detail'


class UAccount(models.Model):
    """
        class in账号
    """
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户')
    app = models.CharField('账号', null=True, blank=True, max_length=50)
    pwd = models.CharField('密码', null=True, blank=True, max_length=50)

    class Meta:
        verbose_name = verbose_name_plural = 'classin管理'
        db_table = 'group_user_account'


class FreeTime(models.Model):
    """
        上课时间
    """
    tch = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='教师')
    date = models.DateField('上课日期', null=True, blank=True)
    start = models.TimeField('上课开始时间', null=True, blank=True)
    end = models.TimeField('上课结束时间', null=True, blank=True)
    status = models.IntegerField("是否已预约", default=0, choices=((0, "未预约"), (1, "已预约")))

    class Meta:
        verbose_name = verbose_name_plural = '上课时间'
        db_table = 'group_freeTime'

    def __str__(self):
        return str(self.date) + ' ' + str(self.start)


class Relation(models.Model):
    """
    关系
    """
    u_id = models.ForeignKey(User, verbose_name='被邀请者', related_name='Relation_user',
                             on_delete=models.CASCADE)
    reference = models.ForeignKey(User, verbose_name='发起邀请者', related_name='reference_user',
                                  on_delete=models.CASCADE)
    is_sub = models.BooleanField('是否参与体验课', default=False)
    is_card = models.BooleanField('是否购买会员卡', default=False)
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '分销管理'
        db_table = 'group_relation'


class Apply(models.Model):
    """
    教师申请
    """
    w = (
        (0, '零基础'),
        (1, '入门级'),
        (2, '高中水平'),
        (3, '大学英语四级'),
        (4, '大学英语六级及以上')
    )
    e = (
        (0, '小学'),
        (1, '初中'),
        (2, '高中'),
        (3, '大学'),
        (4, '硕士'),
        (5, '博士'),
    )
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户', null=True, blank=True)
    phone = models.CharField('手机号', null=True, blank=True, max_length=200)
    name = models.CharField('用户昵称', null=True, blank=True, max_length=200)
    city = models.CharField('所在城市', null=True, blank=True, max_length=30)
    wsk = models.IntegerField('外语水平', default=0, choices=w, null=True, blank=True)
    mail = models.CharField('邮箱', max_length=100, blank=True, null=True)
    edu = models.IntegerField('学历', null=True, blank=True, choices=e)
    sex = models.BooleanField('性别', choices=((False, '女'), (True, '男')), null=True, default=None)
    acert = models.ImageField('学位证书', null=True, blank=True, max_length=200)
    tcert = models.IntegerField('教师资格证', null=True, blank=True, default=2, choices=((0, "否"), (1, "是")))
    picture = models.ImageField('个人照片', null=True, blank=True, max_length=200)
    content = models.TextField('文字介绍', null=True, blank=True)
    voice = models.FileField('语音', null=True, blank=True, max_length=200)
    status = models.IntegerField("状态", choices=((1, '未通过'), (2, "已通过")), null=True, blank=True)
    cause = models.CharField('原因', max_length=200, null=True, blank=True)
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '教师申请'
        db_table = 'group_apply'


class Sort(models.Model):
    """
        课程类型
    """
    name = models.CharField('类别', max_length=20)

    class Meta:
        verbose_name = verbose_name_plural = '课程类型管理'
        db_table = 'group_sort'

    def __str__(self):
        return self.name


class Subject(models.Model):
    """
        课程
    """
    sort = models.ForeignKey(Sort, on_delete=models.DO_NOTHING, verbose_name='类别')
    name = models.CharField('课程名', max_length=100)
    main = models.ImageField('主图', max_length=200)

    class Meta:
        verbose_name = verbose_name_plural = '课程管理'
        db_table = 'group_subject'

    def __str__(self):
        return self.name


class List(models.Model):
    """
        目录
    """
    sub = models.ForeignKey(Subject, on_delete=models.CASCADE, verbose_name='课程')
    name = models.CharField('目录名称', max_length=100)
    time = models.IntegerField('时长/min', default=60)
    price = models.IntegerField('价格/课时', default=1)
    sale = models.IntegerField('销量', default=0)

    class Meta:
        verbose_name = verbose_name_plural = '课程目录管理'
        db_table = 'group_list'

    def __str__(self):
        return self.name


class Detail(models.Model):
    """
        课程详情
    """
    sub = models.ForeignKey(Subject, on_delete=models.DO_NOTHING, verbose_name='课程')
    name = models.TextField('文本介绍', null=True, blank=True, max_length=200)
    image = models.ImageField('图片', null=True, blank=True)

    class Meta:
        verbose_name = verbose_name_plural = '课程详情'
        db_table = 'group_detail'

    def __str__(self):
        return str(self.id)


class Banner(models.Model):
    """
        首页banner
    """
    img = models.ImageField('海报')
    sub = models.ForeignKey(Subject, on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name='课程')

    class Meta:
        verbose_name = verbose_name_plural = '主页banner管理'
        db_table = 'group_banner'


class Order(models.Model):
    """
        订单
    """
    s_cho = (
        (0, '拼课中'),
        (1, '拼课成功'),
        (2, '已完成'),
        (3, '拼课失败'),
        (4, "退课/售后"),
        (5, "投诉"),
        (6, "已过期")
    )
    oid = models.CharField("订单号", max_length=50, blank=True, null=True)
    sub = models.ForeignKey(Subject, on_delete=models.DO_NOTHING, verbose_name='课程', related_name="Order_sub")
    list = models.ForeignKey(List, on_delete=models.DO_NOTHING, verbose_name='目录', related_name="Order_list")
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户', related_name="Order_user")
    partner = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name="伙伴", null=True, blank=True,
                                related_name="Order_partner")
    teacher = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name="教师", related_name="Order_teacher")
    cashout = models.IntegerField("是否提现", default=0, null=True, blank=True,
                                  choices=((0, '未申请'), (1, "已申请"), (2, '已同意'), (3, '已拒绝')))
    cash_id = models.IntegerField("提现申请", null=True, blank=True)
    time = models.ForeignKey(FreeTime, on_delete=models.DO_NOTHING, verbose_name="上课时间", null=True, blank=True,
                             related_name="Order_time")
    sub_time = models.DateTimeField("开课时间", null=True, blank=True)
    price = models.DecimalField('实付/课时', max_digits=8, decimal_places=1, default=0)
    status = models.IntegerField('状态', choices=s_cho, default=0)
    team_type = models.IntegerField('拼课类型', default=0, choices=((0, "平台自动匹配组队"), (1, "公开邀请组队"), (2, "特定邀请组队")))

    # 评价
    ucmted = models.BooleanField('用户已评价', choices=((False, '未评价'), (True, '已评价')), default=False)
    tcmted = models.BooleanField('教师已评价', choices=((False, '未评价'), (True, '已评价')), default=False)

    created = models.DateTimeField('创建时间', auto_now_add=True)
    remarks = models.CharField('备注', max_length=200, null=True, blank=True)
    classin = models.BooleanField('是否开课（classin）', default=False)
    is_delete = models.IntegerField("逻辑删除", default=0)

    class Meta:
        verbose_name = verbose_name_plural = '课程订单管理'
        db_table = 'group_order'

    def __str__(self):
        return self.sub.name + "-" + self.list.name

    def delete(self, using=None, keep_parents=False):
        """重写数据库删除方法实现逻辑删除"""
        print("重写数据库删除方法实现逻辑删除",self)
        self.is_delete = 1
        self.save()

# class Comment(models.Model):
#     """
#     评论内容表
#     """
#     user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户')
#     tch = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='教师')
#     oNo = models.CharField('订单号', max_length=20)
#     content = models.CharField('评价内容', max_length=200)
#     overall = models.DecimalField('综合评价', max_digits=2, decimal_places=1)
#     created = models.DateTimeField('创建时间', auto_now_add=True)
#
#     class Meta:
#         verbose_name = verbose_name_plural = '评价管理'
#         db_table = 'group_comment'
#         unique_together = ('user', 'oNo')
#
#     def __str__(self):
#         return str(self.id)


class SearchType(models.Model):
    """
        邀请条件
    """
    t = (
        (1, "性别"),
        (2, "英语水平"),
        (3, "年龄段")
    )
    ord = models.ForeignKey(Order, on_delete=models.DO_NOTHING, verbose_name='课程')
    type = models.IntegerField(null=True, blank=True, choices=t)
    value = models.CharField("条件", null=True, blank=True, max_length=50)

    class Meta:
        verbose_name = verbose_name_plural = '邀请条件设置'
        db_table = 'group_SearchType'


class Comment(models.Model):
    """
        评论
    """
    STAR_CHOICE = (
        (1, '⭐'),
        (2, '⭐⭐'),
        (3, '⭐⭐⭐'),
        (4, '⭐⭐⭐⭐'),
        (5, '⭐⭐⭐⭐⭐'),
    )
    sub = models.ForeignKey(Subject, on_delete=models.DO_NOTHING, verbose_name='课程', related_name="Comment_sub")
    type = models.IntegerField("类型", default=0, choices=((0, "学生"), (1, "教师")))
    list = models.ForeignKey(List, on_delete=models.DO_NOTHING, verbose_name='目录', related_name="Comment_user")
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户', related_name="Comment_order")
    oid = models.TextField('订单号', null=True, blank=True, default=0)
    comment = models.TextField('评论内容', null=True, blank=True, max_length=200)
    tch_star = models.IntegerField('教师评分', default=5, choices=STAR_CHOICE)
    sub_star = models.IntegerField('课程评分', default=5, choices=STAR_CHOICE)
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '评价'
        db_table = 'group_comment'

    def __str__(self):
        return self.comment


class Card(models.Model):
    """
        会员卡
    """
    # STAR_CHOICE = (
    #     (1, '⭐'),
    #     (2, '⭐⭐'),
    #     (3, '⭐⭐⭐'),
    #     (4, '⭐⭐⭐⭐'),
    #     (5, '⭐⭐⭐⭐⭐'),
    # )
    # card = models.IntegerField('会员等级', choices=STAR_CHOICE)
    name = models.CharField('名称', max_length=200)
    num = models.IntegerField('课时')
    price = models.DecimalField('价格', max_digits=8, decimal_places=1, default=0)
    valid = models.IntegerField(verbose_name='有效期/月', max_length=2, default=10)
    back = models.ImageField('背景', blank=True, null=True, max_length=200)
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '会员卡管理'
        db_table = 'group_card'

    def __str__(self):
        return str(self.price)


class COrder(models.Model):
    """
        会员卡订单
    """
    orderNo = models.CharField('订单号', unique=False, max_length=20)
    tradeNo = models.CharField('交易号', unique=True, blank=True, null=True, max_length=20)
    payNoti = models.SmallIntegerField('支付通知状态', choices=(
        (0, '未通知'), (1, '通知成功'), (2, '通知失败'), (3, '查询支付成功')
    ), default=0)
    have = models.DecimalField('课时余额', max_digits=11, decimal_places=1, default=0)
    userId = models.BigIntegerField('用户ID')
    card = models.ForeignKey(Card, on_delete=models.DO_NOTHING, verbose_name="会员卡", null=True, blank=True)
    fee = models.DecimalField('实付金额', max_digits=11, decimal_places=2)
    status = models.SmallIntegerField('订单状态', choices=(
        (0, '已关闭'),
        (1, '已支付'),
        (2, "已用完")
    ), default=0)
    payTime = models.DateTimeField('支付时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '会员订单管理'

        db_table = 'group_card_order'

    def __str__(self):
        return self.orderNo


class SubTime(models.Model):
    """
        上课时间配置
    """
    start = models.TimeField('起始时间')
    end = models.TimeField('截止时间')
    time = models.IntegerField('课时时长/分钟', default=60)

    class Meta:
        verbose_name = verbose_name_plural = '课程时间配置'

        db_table = 'group_SubTime'


class FormId(models.Model):
    """
        formid
    """
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, verbose_name='用户')
    formid = models.CharField('表单ID', max_length=48)
    used = models.SmallIntegerField('状态', choices=((0, '未使用'), (1, '已使用')), default=0)
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '表单ID管理'
        db_table = 'group_formid'


class Balance(models.Model):
    """
        用户交易
    """
    user = models.IntegerField('用户')
    num = models.DecimalField('课时', max_digits=11, decimal_places=1)

    class Meta:
        verbose_name = verbose_name_plural = '用户交易流水'
        db_table = 'group_balance'


class TchHour(models.Model):
    """
        教师余额表
    """
    tch = models.IntegerField('教师')
    num = models.DecimalField('课时', max_digits=11, decimal_places=1)

    class Meta:
        verbose_name = verbose_name_plural = '教师交易流水'
        db_table = 'group_TchHour'


class Complain(models.Model):
    """
        投诉表
    """
    oid = models.IntegerField("订单", null=True, blank=True)
    user = models.ForeignKey(User, related_name="用户", null=True, blank=True, on_delete=models.DO_NOTHING)
    status = models.IntegerField("退课", choices=((1, "不同意"), (2, "同意")), null=True, blank=True)
    label = models.IntegerField("标签", null=True, blank=True,
                                choices=((1, "教师迟到"), (2, "教师未开课"), (3, "课程效果太差"), (4, "与所学内容不符")))
    content = models.TextField("详细说明", null=True, blank=True)
    reason = models.CharField("处理原因", null=True, blank=True, max_length=200)

    class Meta:
        verbose_name = verbose_name_plural = '投诉管理'
        db_table = 'group_Complain'


class Send(models.Model):
    """
        发送邀请
    """
    order = models.IntegerField('订单id')
    user = models.IntegerField('用户')
    send = models.IntegerField('被邀请用户')

    class Meta:
        verbose_name = verbose_name_plural = '发送邀请'
        db_table = 'group_Send'


class Befriend(models.Model):
    """
        申请成为好友
    """
    user = models.IntegerField('申请人')
    parnter = models.IntegerField('被邀请人')
    type = models.IntegerField('是否同意', null=True, blank=True, choices=((1, "已申请"), (2, "已同意"), (3, "已拒绝")))

    class Meta:
        verbose_name = verbose_name_plural = '申请成为好友'
        db_table = 'group_Befriend'


class Video(models.Model):
    """
        课程视频
    """
    file = models.FileField('视频文件', )

    class Meta:
        verbose_name = verbose_name_plural = '课程视频'
        db_table = 'group_Video'


class Invite(models.Model):
    """
         邀请好友分销
     """
    user = models.IntegerField('用户')
    parnter = models.ForeignKey(User, related_name="新用户", null=True, blank=True, on_delete=models.DO_NOTHING)
    task1 = models.BooleanField('任务一', default=False)
    task1_type = models.IntegerField('是否提现', default=0, choices=((1, "可提现"), (2, "已提现")))
    task2 = models.BooleanField('任务二', default=False)
    fee = models.DecimalField('实付金额', max_digits=11, decimal_places=2, default=0)
    task2_type = models.IntegerField('是否提现', default=0, choices=((1, "可提现"), (2, "已提现")))
    task3 = models.BooleanField('任务三', default=False)
    task3_type = models.IntegerField('是否返课时', default=0, choices=((1, "可返"), (2, "已返")))

    class Meta:
        unique_together = ('parnter',)
        verbose_name = verbose_name_plural = '邀请好友分销'
        db_table = 'group_Invite'


class TchbeOut(models.Model):
    """
        提现申请
    """
    kes = models.IntegerField('课时', default=0)
    type = models.IntegerField('打款', default=0, choices=((0, '待处理'), (1, "已打款"), (2, '拒绝打款')))
    reason = models.TextField('原因', null=True, blank=True)
    tch = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name='教师')
    created = models.DateTimeField('创建时间', auto_now_add=True)

    class Meta:
        verbose_name = verbose_name_plural = '教师提现申请'
        db_table = 'group_TchbeOut'


class Platform(models.Model):
    """
         平台管理
     """
    name = models.CharField('平台名称', max_length=20)
    logo = models.ImageField('logo')
    brief = models.TextField('关于我们简介')
    phone = models.CharField('客服电话', max_length=20)

    class Meta:
        verbose_name = verbose_name_plural = '平台管理'
        db_table = 'group_Platform'
