# healthcheck file
# e.g.
pgrep php &>dev/null || php-fpm7 &
curl -fs -I http://${DOMAIN_NAME:-localhost}/ || exit 1
