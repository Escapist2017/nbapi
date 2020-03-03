# -*- coding: utf-8 -*-
# @Time : 2020年02月25日 23时01分
# @Email : 15669909922@163.com
# @Author : HuangChuan
# @File : conf.py.py
# @notice ：

import multiprocessing

bind = "127.0.0.1:8001"
workers = multiprocessing.cpu_count() * 2
worker_class = 'gevent'

"""
gunicorn --config=conf.py NbApi.wsgi:application
"""