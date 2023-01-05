FROM apache/apisix:2.15.0-alpine

ENV TZ="Asia/Shanghai"

RUN mkdir -p /etc/nginx &&\
    sed -i '$a include /etc/nginx/global/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/global &&\
    sed -i '$a include /etc/nginx/stream/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/stream &&\
    sed -i '$a include /etc/nginx/http/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/http

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]

