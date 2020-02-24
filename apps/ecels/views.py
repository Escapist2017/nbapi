from rest_framework.authentication import TokenAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework import mixins
from rest_framework.pagination import PageNumberPagination
from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from .models import CellsLevel, CellsInfo
from .filters import CellsLevelFilter,CellsInfoFilter,CellsLevelSearchFilter,CellsTypeSearchFilter
from .serializers import CellsLevelSerializer, CellsInfoSerializer, CellsTypeSerializer
from utils.permissions import IsOwnerOrReadOnly

class CellsPagination(PageNumberPagination):
    page_size = 10 # 每页显示的多少条记录
    page_size_query_param = 'page_size' # 前台控制每页显示多少条
    page_query_param = "p"  # 前台查询第几页的参数
    max_page_size = 100 # 后台控制显示的最大记录条数，防止前台输入的查询条数过大
    page_query_description = ('分页结果集中的页码')
    page_size_query_description = ('每页返回的结果数')

class CellsLevelViewSet(mixins.ListModelMixin,mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    list:
        获取所有共站的树结构列表,共站名->基站名->扇区名->小区详情
    retrieve:
        获取某一共站的树结构详情,共站名->基站名->扇区名->小区详情
    """
    queryset = CellsLevel.objects.filter(level_type=1)
    serializer_class = CellsLevelSerializer
    # 设置认证及权限
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    # 过滤及搜索
    filter_backends = (DjangoFilterBackend, CellsLevelSearchFilter)
    filter_class = CellsLevelFilter
    # 分页
    pagination_class = CellsPagination
    # lookup_field =
    # def get_queryset(self):
    #     return CellsLevel.objects.filter(user = self.request.user)

class CellsTypeViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    list:
        获取搜索类型的模糊搜索列表
    """
    queryset = CellsLevel.objects.all()
    serializer_class = CellsTypeSerializer
    # 设置认证及权限
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    # 过滤及搜索
    filter_backends = (DjangoFilterBackend, CellsTypeSearchFilter)
    search_fields = ('name',)
    # 自定义详情查询(默认的”pk”来查询模型类对象) url/id
    lookup_field = ('level_type',)
    # 分页
    pagination_class = CellsPagination


class CellsDetailViewSet(mixins.ListModelMixin,mixins.RetrieveModelMixin,mixins.CreateModelMixin,
                         mixins.UpdateModelMixin,mixins.DestroyModelMixin,viewsets.GenericViewSet):
    """
    list:
        获取所有小区的工参信息
    retryeve:
        获取某个小区的工参信息
    update:
        更新某条工参信息
    destroy:
        删除某条工参信息
    """
    queryset = CellsInfo.objects.all()
    serializer_class = CellsInfoSerializer
    pagination_class = CellsPagination
    # 设置认证及权限
    # authentication_classes = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    # 过滤及搜索
    filter_backends = (DjangoFilterBackend, )
    filter_class = CellsInfoFilter

