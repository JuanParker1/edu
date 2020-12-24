from django.contrib import admin
from daterange_filter.filter import DateRangeFilter
from jet.admin import CompactInline


from .models import *
from utils.admin import *
from utils import model_2_dict





'''
# Register your models here.DateField
# list_display 设置显示字段
#  readonly_fields 只读字段DateRangeFilter
# list_per_page设置每页显示多少条记录，默认是100条
# ordering设置默认排序字段，负号表示降序排序
# ordering = ('-publish_time',)
# list_editable 设置默认可编辑字段
# list_editable = ['machine_room_id', 'temperature']
# fk_fields 设置显示外键字段
# fk_fields = ('machine_room_id',)
# search_fields = ('server', 'net', 'mark')  # 搜索字段
# date_hierarchy = 'go_time'    # 详细时间分层筛选
# list_filter = ('trouble', 'go_time', 'act_man__user_name', 'machine_room_id__machine_room_name')  # 过滤器


# 首先多ManyToMany多对多字段设置。可以用filter_horizontal或filter_vertical：
# #Many to many 字段
# filter_horizontal=('tags',)

# exclude = ('recommend',) #排除该字段
'''


# Register your models here.
class UserDetailInline(admin.TabularInline):
    model = UserDetail
    extra = 1


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    """
        用户
    """
    list_display = (
        'id', 'src', 'name', 'utype', 'wx_name', 'phone', 'birth', 'sex', 'mail', "wx_num", 'edu', 'ocp', 'industry',
        'wsk')
    search_fields = ('id', 'name', 'wx_name', 'phone', 'birth', 'sex', 'mail', "wx_num",)
    list_filter = ('edu', 'utype', 'ocp', 'industry', 'wsk', 'sex')
    inlines = [UserDetailInline, ]

    def src(self, obj):
        try:
            avatar = obj.avatar.url
        except:
            avatar = "http://img.aeclub.top/basicprofile.jpeg"
        return to_img(50, 50, avatar)

    src.short_description = '海报'


@admin.register(UAccount)
class UAccountAdmin(admin.ModelAdmin):
    """
        用户class in
    """
    list_display = ('id', 'username', 'app', 'pwd')
    search_fields = ('id', 'user', 'app', 'pwd')

    # 伙伴
    def username(self, obj):
        try:
            return obj.user.name if obj.user.name else obj.user.wx_name
        except:
            return ''

    username.short_description = "用户"


@admin.register(Invite)
class InviteAdmin(admin.ModelAdmin):
    """
        分销
    """
    list_display = (
        'id', 'username', 'parntername', 'task1', 'task1_type', 'task2', 'task2_type', 'task3', 'task3_type')
    list_filter = ('task1', 'task1_type', 'task2', 'task2_type', 'task3', 'task3_type')

    def username(self, obj):
        try:
            pass
            # return obj.user.name if obj.u_id.name else obj.u_id.wx_name
        except:
            return ''

    username.short_description = "用户"

    def parntername(self, obj):
        try:
            return obj.reference.name if obj.reference.name else obj.reference.wx_name
        except:
            return ''

    parntername.short_description = "发起邀请人"


@admin.register(Sort)
class SortAdmin(admin.ModelAdmin):
    """
        课程类型
    """
    list_display = ('id', 'name')
    search_fields = ('id', 'name',)


class ListInline(CompactInline):
    model = List
    extra = 1
    show_change_link = True


class DetailInline(CompactInline):
    model = Detail
    extra = 1
    show_change_link = True


@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    """
        课程
    """
    list_display = ('id', 'sort', 'name', 'src', 'copy_current_data')
    search_fields = ('id', 'sort', 'name')
    inlines = [ListInline, DetailInline, ]

    def src(self, obj):
        try:
            return to_img(100, 200, obj.main.url)
        except:
            return None

    src.short_description = '封面图'

    def copy_current_data(self, obj):
        """自定义一个a标签，跳转到实现复制数据功能的url"""
        return mark_safe('<a href="https://xcx.aeclub.top/admin/app/list?sub__name={0}">查看目录</a>'.format(obj.name))

    copy_current_data.short_description = '目录'
    copy_current_data.allow_tags = True


@admin.register(List)
class ListAdmin(admin.ModelAdmin):
    """
        目录
    """
    list_display = ('id', 'sub', 'name', 'time', 'price', 'sale')
    list_filter = ('sub__name',)


@admin.register(Banner)
class BannerAdmin(admin.ModelAdmin):
    """
        banner
    """
    list_display = ('id', 'src', 'sub')

    def src(self, obj):
        return to_img(100, 200, obj.img.url)

    src.short_description = '海报'


@admin.register(Industry)
class IndustryAdmin(admin.ModelAdmin):
    """
        行业
    """
    list_display = ('id', 'name')


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """
        课程订单
    """
    list_display = (
        'id', 'oid', 'sub', 'list', 'username', 'partnername', 'teachername', 'classtime', 'price', 'status', 'created',
        'team_type')
    # ('sub_time', DateRangeFilter)
    list_filter = ('sub', 'list', 'teacher', 'status')
    search_fields = ('id', 'oid',)

    # get_queryset
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        return qs.filter(is_delete=0)

    # 逻辑删除
    def delete_model(self, request, obj):
        obj.is_delete = 1
        obj.save()

    # 批量删除时，
    def delete_queryset(self, request, queryset):
        """Given a queryset, delete it from the database."""
        queryset.update(is_delete=1)

    # 用户
    def username(self, obj):
        return obj.user.name if obj.user.name else obj.user.wx_name

    username.short_description = "用户"

    # 伙伴
    def partnername(self, obj):
        try:
            return obj.partner.name if obj.partner.name else obj.partner.wx_name
        except:
            return ''

    partnername.short_description = "伙伴"

    # 教师
    def teachername(self, obj):
        try:
            return obj.teacher.name if obj.teacher.name else obj.teacher.wx_name
        except:
            return ''

    teachername.short_description = "教师"

    # 上课时间
    def classtime(self, obj):

        try:
            return str(obj.time.date) + " " + str(obj.time.start) + "~" + str(obj.time.end)
        except:
            return ''

    classtime.short_description = "上课时间"


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    """
        评价
    """
    list_display = ('id', 'sub', 'type', 'list', 'user', 'oid', 'comment', 'tch_star', 'sub_star', 'created')
    search_fields = ('id', 'sub', 'type', 'list', 'user', 'oid', 'comment', 'tch_star', 'sub_star')
    list_filter = ('sub', 'type', 'list',)


@admin.register(Card)
class CardAdmin(admin.ModelAdmin):
    """
        会员
    """
    list_display = ('id', 'num', 'price', 'valid')


@admin.register(COrder)
class COrderAdmin(admin.ModelAdmin):
    """
        会员交易记录
    """
    list_display = ('id', 'orderNo', 'user', 'card', 'have', 'status', 'payTime')

    # 购买者
    def user(self, obj):
        try:
            user_obj = User.objects.get(id=obj.userId)
            return user_obj.name if user_obj.name else user_obj.wx_name
        except:
            return ''

    user.short_description = "购买者"


@admin.register(Apply)
class ApplyAdmin(admin.ModelAdmin):
    """
        教师申请
    """
    list_display = (
        'id', 'name', 'phone', 'wsk', 'mail', 'edu', 'sex', 'tcert', 'content', 'acert_src', 'picture_src',
        'voice_sound', 'status', 'cause')
    search_fields = ('id', 'name', 'phone', 'mail', 'content')
    list_filter = ('wsk', 'edu', 'sex', 'tcert', 'status')
    list_editable = ('status', 'cause')

    def acert_src(self, obj):
        return to_img(100, 200, obj.acert.url)

    acert_src.short_description = "学位证书"

    def picture_src(self, obj):
        return to_img(100, 200, obj.picture.url)

    picture_src.short_description = "个人照片"

    def voice_sound(self, obj):
        return mark_safe('<audio controls><source src="{0}" type="audio/mpeg"></audio>'.format(obj.voice.url))

    voice_sound.short_description = "音频"


@admin.register(SubTime)
class SubTimeAdmin(admin.ModelAdmin):
    """
    课程时间配置
    """
    list_display = ('id', 'start', 'end', 'time')


#
# @admin.register(Balance)
# class BalanceAdmin(admin.ModelAdmin):
#     """BalanceAdmin
#     课时交易记录
#     """
#     list_display = ('id', 'user', 'num',)


@admin.register(Complain)
class ComplainAdmin(admin.ModelAdmin):
    """
    课程投诉
    """
    list_display = ('id', 'username', 'oid', 'label', 'content', 'status', 'reason')
    list_editable = ('status', 'reason',)
    search_fields = ('oid',)
    list_filter = ('status', 'label')

    #
    # 购买者
    def username(self, obj):
        try:

            return obj.user.name if obj.user.name else obj.user.wx_name
        except:
            return ''

    username.short_description = "发起人"


@admin.register(TchbeOut)
class TchbeOutAdmin(admin.ModelAdmin):
    """
    教师提现申请
    """
    list_display = ('id', 'tch', 'kes', 'type')
    list_editable = ('type',)


@admin.register(Video)
class VideoAdmin(admin.ModelAdmin):
    """
    课程视频
    """
    list_display = ('id', 'video', 'url')

    # 视频页面地址
    def url(self, obj):
        return "pages/video/video?id=" + str(obj.id)

    def video(self, obj):
        return mark_safe(
            '<video width="320px" height="240px" controls="controls">  <source src="{0}" type="video/mp4"/></video>'.format(
                obj.file.url))

    video.short_description = "视频"
    url.short_description = "url"


@admin.register(Platform)
class PlatformAdmin(admin.ModelAdmin):
    """
    平台管理
    """
    list_display = ('id', 'src', 'name', 'phone', 'brief')

    def src(self, obj):
        try:
            return to_img(100, 200, obj.logo.url)
        except:
            return None

    src.short_description = 'logo'
