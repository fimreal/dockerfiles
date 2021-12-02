FROM openresty/openresty:alpine
#FROM nginx:stable-alpine

# Motify timezone as needed
ENV TZ="Asia/Shanghai"
# For healthcheck if nginx alived
ENV DOMAIN_NAME="localhost"

# Apk mirrors proxy in China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache php7-fpm php7-pdo_mysql php7-tokenizer \
    php7-xml php7-pdo php7-phar php7-openssl \
    php7-json php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader \
    curl openssl tzdata &&\
    sed -i 's/expose_php = On/expose_php = Off/g' /etc/php7/php.ini   # hide php version
    
RUN sed -i sed '$a include /etc/nginx/conf.d/global/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/conf.d/global &&\
    sed -i sed '$a include /etc/nginx/conf.d/stream/*.conf;' /usr/local/openresty/nginx/conf/nginx.conf && mkdir /etc/nginx/conf.d/stream

ADD . /

VOLUME ["/wwwroot","/etc/nginx/conf.d"]

HEALTHCHECK  --interval=20s --timeout=3s \
    CMD /healthcheck.sh

EXPOSE 9000 80 443

ENTRYPOINT ["/entrypoint.sh"]
