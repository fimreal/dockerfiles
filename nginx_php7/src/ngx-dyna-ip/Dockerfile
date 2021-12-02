FROM openresty/openresty:alpine
EXPOSE 80 1080
RUN touch /tmp/ngxwhiteip.txt
COPY nginx.conf  /usr/local/openresty/nginx/conf/nginx.conf
