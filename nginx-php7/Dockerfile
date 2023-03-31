FROM openresty/openresty:alpine

# Copy supervisord bin command
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord
CMD ["/usr/local/bin/supervisord"]

# Motify timezone as needed
ENV TZ="Asia/Shanghai"

# php7
RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories 

# Apk mirrors proxy in China
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache php7-fpm php7-pdo_mysql php7-tokenizer \
    php7-xml php7-pdo php7-phar php7-openssl \
    php7-json php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader \
    curl openssl tzdata &&\
    sed -i 's/expose_php = On/expose_php = Off/g;s/post_max_size = 8M/post_max_size = 0/g;s/upload_max_filesize = 2M/upload_max_filesize = 5G/g' /etc/php7/php.ini 

VOLUME ["/wwwroot"]

ADD ./default.conf /etc/nginx/conf.d/default.conf
ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 80
