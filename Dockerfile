# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER xiuc001 "972994718@qq.com"
RUN echo "deb http://mirrors.aliyun.com/ubuntu trusty main restricted" > /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted" >> /etc/apt/sources.list && echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list && echo "deb http://mirrors.aliyun.com/ubuntu/ trusty universe" >> /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty universe" >> /etc/apt/sources.list && echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list && echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted" >> /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted" >> /etc/apt/sources.list && echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-security universe" >> /etc/apt/sources.list && echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security universe" >> /etc/apt/sources.list
ENV REFRESHED_AT 2016-12-01
RUN apt-get update && apt-get install -y nginx
RUN echo 'Hi, I am in your container' > /usr/share/nginx/html/index.html
RUN useradd xiuc001
WORKDIR /home/xiuc001
RUN touch /home/xiuc001/test.log
VOLUME ["/home/xiuc001/soft"]
LABEL version="1.0.0" location="HangZhou"
ADD chapter0 /home/xiuc001/test/
ADD tmp/ /home/xiuc001/test/
ADD http://pic55.nipic.com/file/20141208/19462408_171130083000_2.jpg /home/xiuc001/1.png
RUN chown -R xiuc001:xiuc001 /home/xiuc001
ONBUILD ADD chapter0 /home/xiuc001
USER xiuc001
EXPOSE 80
ENTRYPOINT ["/bin/bash"]
