# -*- coding: utf-8 -*-
# @Time : 2020年03月03日 17时04分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : sendEmail.py
# @notice ：
import json
import requests
import smtplib
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

class SendEmail(object):

    def __init__(self, api_key):
        self.api_key = api_key
        self.single_send_url = "https://sms.yunpian.com/v2/sms/single_send.json"

    def send_sms(self, code, mobile):
        parmas = {
            "apikey": self.api_key,
            "mobile": mobile,
            "text": "【慕学生鲜】您的验证码是{code}。如非本人操作，请忽略本短信".format(code=code)
        }

        response = requests.post(self.single_send_url, data=parmas)
        re_dict = json.loads(response.text)
        return re_dict

class SendEmail(object):

    def __init__(self):
        self.from_addr = 'chuanhuangnw@163.com'
        self.password = 'try325600'
        self.smtp_server = "smtp.163.com"

    def send_email(self, code, email):

        # msg = MIMEMultipart()
        msg = MIMEText('您的验证码为【{}】,5分钟内有效。'.format(code), 'plain', 'utf-8')
        msg['From'] = Header('系统邮箱', 'utf-8').encode()
        msg['To'] = email
        msg['Subject'] = Header('工参管理平台注册验证', 'utf-8').encode()
        res = {}
        try:
            server = smtplib.SMTP_SSL(self.smtp_server, 465)
            server.login(self.from_addr, self.password)
            server.sendmail(self.from_addr, email, msg.as_string())
            res['code'] = 0
            res['msg'] = '邮件发送成功'
        except smtplib.SMTPException:
            res['code'] = -1
            res['msg'] = '不能发送邮件'
        finally:
            server.quit()
        return res

if __name__ == "__main__":
    yun_pian = SendEmail("")
    yun_pian.send_sms("2017", "18092671458")