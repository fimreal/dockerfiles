#!/usr/bin/env sh
#########################################################################
# File Name: entrypoint.sh
# Author: Fimreal
# Email:  lmr@epurs.com
# Version: 1.0
# Created Time: 2020-05-12
# Describe:  for container to start
#########################################################################

export nginx_Htmldir=/wwwroot
export nginx_Confdir=/etc/nginx/conf.d

chown -R nobody:nobody ${nginx_Htmldir}

# A easy way to run php
php-fpm7 &

# And run nginx
openresty -g "daemon off;"
