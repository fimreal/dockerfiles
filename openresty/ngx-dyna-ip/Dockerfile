FROM openresty/openresty:alpine

ENV TZ="Asia/Shanghai"

RUN sed -i '$a include /etc/nginx/global/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/global &&\
    sed -i '$a include /etc/nginx/stream/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/stream &&\
    touch /tmp/ngxwhiteip.txt
