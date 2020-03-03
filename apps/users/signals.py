# -*- coding: utf-8 -*-
# @Time : 2020年02月22日 21时04分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : signals.py
# @notice ：
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token
from django.contrib.auth import get_user_model

User = get_user_model()

# 加了这个 导致 create superuser 的时候加密两次！！！
# @receiver(post_save, sender=User)
# def create_user(sender, instance=None, created=False, **kwargs):
#     if created:
#         password = instance.password
#         instance.set_password(password)
#         instance.save()