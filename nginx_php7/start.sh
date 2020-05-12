#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Imroc
# Email:  6913651@qq.com
# Version: 1.0
# Created Time: 2018-11-02
# Describe:  for container to start
#########################################################################

nginx_Html=/usr/share/nginx/html/
nginx_Conf=/etc/nginx/

chown -R nginx:nginx $nginx_Html

# run php
php-fpm7 &

# run nginx
nginx -g "daemon off;"
