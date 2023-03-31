FROM openresty/openresty:alpine

# Copy supervisord bin command
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord
CMD ["/usr/local/bin/supervisord"]

# Motify timezone as needed
ENV TZ="Asia/Shanghai"

# Apk mirrors proxy in China
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache php81-fpm php81-pdo_mysql php81-tokenizer \
    php81-xml php81-pdo php81-phar php81-openssl php81-pdo_pgsql\
    php81-json php81-pdo_mysql php81-mysqli php81-session \
    php81-pdo_sqlite php81-sqlite3 php81-exif php81-intl \
    php81-gd php81-iconv php81-gmp php81-zip \
    php81-curl php81-opcache php81-ctype php81-apcu \
    php81-intl php81-bcmath php81-dom php81-mbstring php81-xmlreader \
    php81-pecl-memcache php81-pecl-redis php81-ftp \
    curl openssl tzdata &&\
    sed -i 's/expose_php = On/expose_php = Off/g;s/post_max_size = 8M/post_max_size = 0/g;s/upload_max_filesize = 2M/upload_max_filesize = 5G/g' /etc/php81/php.ini 

VOLUME ["/wwwroot"]

ADD ./default.conf /etc/nginx/conf.d/default.conf
ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 80
