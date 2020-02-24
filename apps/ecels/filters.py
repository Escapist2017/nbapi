# -*- coding: utf-8 -*-
# @Time : 2020年02月19日 19时02分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : filters.py
# @notice ：

from django_filters import rest_framework as filters
from rest_framework.filters import SearchFilter
from .models import CellsLevel, CellsInfo

class CellsLevelFilter(filters.FilterSet):
    """
    共站名过滤类
    """
    name = filters.CharFilter(field_name="name", help_text='共站名过滤')
    level_type = filters.CharFilter(field_name="level_type", help_text='共站名=1,基站名=2,小区名=4')
    class Meta:
        model = CellsLevel
        fields = ['name', 'level_type']

class CellsInfoFilter(filters.FilterSet):
    """
    小区信息过滤类
    """
    city = filters.CharFilter(field_name="city", help_text = '区县过滤')
    common_site_name = filters.CharFilter(field_name="common_site_name", help_text = '共站名过滤')
    site_name = filters.CharFilter(field_name="common_site_name", help_text='基站名过滤')
    sector = filters.CharFilter(field_name="sector", help_text='扇区名过滤')
    cell_name = filters.CharFilter(field_name="cell_name", help_text='小区名过滤')
    site_id = filters.CharFilter(field_name="site_id", help_text='站号过滤')
    enbid = filters.CharFilter(field_name="enbid", help_text='eNBID过滤')
    eci = filters.CharFilter(field_name="eci", help_text='ECI过滤')

    class Meta:
        model = CellsInfo
        fields = ['city','common_site_name','site_name', 'sector', 'cell_name', 'site_id', 'enbid', 'eci']


class CellsLevelSearchFilter(SearchFilter):
    """
    自定义SearchFilter
    """
    search_description = ("共站名、基站名、小区名、eNBID、ECI的搜索")
    def get_search_fields(self, view, request):
        search_fields = ('=name', '=sub_lev__name',
                         '=sub_lev__sub_lev__sub_cells__cell_name',
                         '=sub_lev__sub_lev__sub_cells__enbid',
                         '=sub_lev__sub_lev__sub_cells__eci')  # 实现多级层级查询
        return search_fields


class CellsTypeSearchFilter(SearchFilter):
    """
    自定义SearchFilter
    """
    search_description = ("共站名、基站名、小区名的模糊搜索")
    def get_search_fields(self, view, request):
        search_fields = ('name',)
        return search_fields