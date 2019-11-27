FROM python:3.7-alpine

ENV DJANGO_VERSION 2.2.4

RUN pip install django=="$DJANGO_VERSION" -i https://mirrors.aliyun.com/pypi/simple/

RUN mkdir /app

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk add build-base python-dev py-pip jpeg-dev zlib-dev mysql-dev linux-headers

ENV LIBRARY_PATH=/lib:/usr/lib

RUN pip install uwsgi -i https://mirrors.aliyun.com/pypi/simple/

EXPOSE 80

CMD uwsgi --ini wsgi.ini
