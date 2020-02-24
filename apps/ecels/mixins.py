# -*- coding: utf-8 -*-
# @Time : 2020年02月24日 11时15分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : mixins.py
# @notice ：

from django.shortcuts import HttpResponse

class ExportMixin(object):
    def get(self, requset):
        filename = requset.GET.get('filename', default='download.xls')
        format = requset.GET.get('format', default='xlsx')
        empty = requset.GET.get('empty', default=False)
        queryset = None
        if not empty:
            queryset = self.filter_queryset(self.get_queryset())
        resourse = self.resource_class()
        export_data = resourse.export(queryset, empty)
        return attachment_response(getattr(export_data, format), filename=filename)

def attachment_response(export_data, filename='download.xls', content_type='application/vnd.ms-excel'):
    # Django 1.7 uses the content_type kwarg instead of mimetype
    try:
        response = HttpResponse(export_data, content_type=content_type)
    except TypeError:
        response = HttpResponse(export_data, mimetype=content_type)
    response['Content-Disposition'] = 'attachment; filename={}'.format(filename)
    return response