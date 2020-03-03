# -*- coding: utf-8 -*-
# @Time : 2020年02月22日 16时37分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : SmsSerializer.py
# @notice ：
from rest_framework.validators import UniqueValidator
import re
from rest_framework import serializers

from django.contrib.auth import get_user_model
from NbApi.settings import REGEX_MOBILE,REGEX_EMAIL
from datetime import datetime, timedelta
from .models import VerifyCode
User = get_user_model()

class SmsSerializer(serializers.Serializer):

    # mobile = serializers.CharField(max_length=11)
    email = serializers.EmailField(max_length=30)
    def validate_email(self, email):
        """
        验证手机号码或邮箱
        """
        # 手机或邮箱是否注册
        if User.objects.filter(email=email).count():
            raise serializers.ValidationError('邮箱已经存在')

        #验证手机号码是否合法
        # if not re.match(REGEX_MOBILE, mobile):
        #     raise serializers.ValidationError('手机号码非法')

        # 验证邮箱是否合法
        if not re.match(REGEX_EMAIL, email):
            raise serializers.ValidationError('邮箱非法')

        #验证码发送频率
        one_mintes_age = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_mintes_age, email=email):
            raise serializers.ValidationError("距离上一次发送未超过60s")

        return email

class UserDetailSerializer(serializers.ModelSerializer):
    """
    用户详情序列化
    """
    class Meta:
        model = User
        fields = ("username", "gender", "birthday", "email", "mobile")

class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(label="验证码",required=True,write_only=True,max_length=6,min_length=6,
                                 error_messages={
                                     "blank": "请输入验证码",
                                     "required": "请输入验证码",
                                     "max_length": "验证码格式错误",
                                     "min_length": "验证码格式错误"
                                 },help_text="验证码")

    username = serializers.CharField(label="用户名",help_text="用户名", required=True, allow_blank=False,
                                     validators=[UniqueValidator(queryset=User.objects.all(), message="用户已经存在")])

    password = serializers.CharField(label="密码",style={'input_type': 'password'},required=True,help_text="密码",write_only=True)

    email = serializers.EmailField(label="邮箱",required=True,help_text="邮箱", allow_blank=False,
                                   validators=[UniqueValidator(queryset=User.objects.all(), message="邮箱已经存在")])

    # 调用父类的create方法，该方法会返回当前model的实例化对象即user。
    # 前面是将父类原有的create进行执行，后面是加入自己的逻辑  (这块换成信号量了） -- 信号量不靠谱 还是换回来
    def create(self, validated_data):
        user = super(UserRegSerializer, self).create(validated_data=validated_data)
        user.set_password(validated_data["password"])
        user.save()
        return user

    def validate_code(self, code):

        # get与filter的区别: get有两种异常，一个是有多个，一个是一个都没有。
        # try:
        #     verify_records = VerifyCode.objects.get(mobile=self.initial_data["username"], code=code)
        # except VerifyCode.DoesNotExist as e:
        #     pass
        # except VerifyCode.MultipleObjectsReturned as e:
        #     pass

        # 验证码在数据库中是否存在，用户从前端post过来的值都会放入initial_data里面，排序(最新一条)。
        verify_records = VerifyCode.objects.filter(email=self.initial_data["email"]).order_by("-add_time")
        if verify_records:
            # 获取到最新一条
            last_record = verify_records[0]

            # 有效期为五分钟。
            five_mintes_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
            if five_mintes_ago > last_record.add_time:
                raise serializers.ValidationError("验证码过期")

            if last_record.code != code:
                raise serializers.ValidationError("验证码错误")

        else:
            raise serializers.ValidationError("验证码错误")

    # 不加字段名的验证器作用于所有字段之上。attrs是所有字段 validate之后返回的总的dict
    def validate(self, attrs):
        # attrs["mobile"] = attrs["username"]
        del attrs["code"]  # 可以把code删除
        return attrs

    class Meta:
        model = User
        fields = ("username", "code", "email", "password")

