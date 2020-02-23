# -*- coding: utf-8 -*-
# @Time : 2020年02月22日 20时27分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : adminx.py
# @notice ：

import xadmin
from xadmin import views
from .models import VerifyCode


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "工参管理平台"
    site_footer = "my@my.com"
    # menu_style = "accordion"


class VerifyCodeAdmin(object):
    list_display = ['code', 'mobile', "add_time"]


xadmin.site.register(VerifyCode, VerifyCodeAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)