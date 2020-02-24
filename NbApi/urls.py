
from django.contrib import admin
import xadmin
from django.urls import path, re_path, include
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter
from ecels.views import CellsLevelViewSet, CellsTypeViewSet, CellsDetailViewSet, CellExportView
from users.views import SmsCodeViewset, UserViewset
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'celltype', CellsTypeViewSet, basename="celltype")
router.register(r'celltree', CellsLevelViewSet, basename="celltree")
router.register(r'celldetail', CellsDetailViewSet, basename="celldetail")
router.register(r'code', SmsCodeViewset, basename="code")
router.register(r'users', UserViewset, basename="users")

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    # 调试登录
    path('api-auth/', include('rest_framework.urls')),
    path('docs/', include_docs_urls(title='工参接口文档')),
    # drf自带的token认证
    # path('api-token-auth/', views.obtain_auth_token),
    # jwt认证接口
    path('login/', obtain_jwt_token),
    path('', include(router.urls)),
    path('cellexport',CellExportView.as_view(), name='cellexport')
]