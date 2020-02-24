# -*- coding: utf-8 -*-
# @Time : 2020年02月24日 11时50分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : resources.py
# @notice ：
from __future__ import absolute_import
from import_export import resources
from .models import CellsInfo

class CellResource(resources.ModelResource):
    def get_export_headers(self):
        return [u'地市', u'区县', u'基站名', u'小区名', u'站号', u'eNBID', u'本地小区ID', u'ECI', u'物理小区标识',
                u'PCIMOD3', u'跟踪区', u'经度', u'纬度', u'频段', u'频点号', u'带宽', u'站型', u'方位角',
                u'站高', u'总俯仰角', u'内置下倾角', u'电下倾角', u'机械下倾角', u'厂家', u'网格信息', u'类型', u'共站名',
                u'扇区', u'描述', u'添加时间']
    class Meta:
        model = CellsInfo
        fields = ('dist','city','site_name','cell_name','site_id','enbid','local_cell_id','eci','physical_cell_id',
                  'pci_mod3','tac','longitude','latitude','frequency_band','frequency_point','bandwidth','site_type',
                  'azimuth','station_height','total_pitch_angle','inner_pitch_angle','electronic_pitch_angle',
                  'mechanical_pitch_angle','sprod_name','grid_info','band_type','common_site_name','sector','desc','add_time')
        export_order = ('dist','city','site_name','cell_name','site_id','enbid','local_cell_id','eci','physical_cell_id',
                  'pci_mod3','tac','longitude','latitude','frequency_band','frequency_point','bandwidth','site_type',
                  'azimuth','station_height','total_pitch_angle','inner_pitch_angle','electronic_pitch_angle',
                  'mechanical_pitch_angle','sprod_name','grid_info','band_type','common_site_name','sector','desc','add_time')