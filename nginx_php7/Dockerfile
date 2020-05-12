FROM nginx:stable-alpine

ADD . /

ENV TZ="Asia/Shanghai"
ENV DOMAIN_NAME="localhost"

RUN apk add --no-cache php7-fpm php7-pdo_mysql php7-tokenizer \
    php7-xml php7-pdo php7-phar php7-openssl \
    php7-json php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader \
    curl openssl &&\
    sed -i 's/nobody/nginx/' /etc/php7/php-fpm.d/www.conf &&\
    sed -i 's/expose_php = On/expose_php = Off/g' /etc/php7/php.ini &&\
    mkdir -p --mode=777 /run/nginx/ 

VOLUME /usr/share/nginx/html/

HEALTHCHECK  --interval=20s --timeout=3s \
    CMD /healthcheck.sh

EXPOSE 9000 80 443

CMD ["/start.sh"]
