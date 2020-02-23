# -*- coding: utf-8 -*-
# @Time : 2020年02月23日 16时27分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : adminx.py
# @notice ：

import xadmin
from xadmin import views
from .models import CellsInfo,CellsLevel

class CellsInfoAdmin(object):
    list_display = [
        'dist',
        'city',
        'site_name',
        'cell_name',
        'site_id',
        'enbid',
        'local_cell_id',
        'eci',
        'physical_cell_id',
        'pci_mod3',
        'tac',
        'longitude',
        'latitude',
        'frequency_band',
        'frequency_point',
        'bandwidth',
        'site_type',
        'azimuth',
        'station_height',
        'total_pitch_angle',
        'inner_pitch_angle',
        'electronic_pitch_angle',
        'mechanical_pitch_angle',
        'sprod_name',
        'grid_info',
        'band_type',
        'common_site_name',
        'sector',
        'desc',
        'add_time'
    ]

    search_fields = ['common_site_name', 'site_name', 'cell_name', 'enbid' ,'eci']
    list_filter = ['city',]

xadmin.site.register(CellsInfo, CellsInfoAdmin)
