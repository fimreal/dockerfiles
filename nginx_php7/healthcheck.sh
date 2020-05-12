# healthcheck file
# e.g.
curl -fs -I http://127.0.0.1 -H "host: ${DOMAIN_NAME:-localhost}" || exit 1
pgrep -a php || exit 1
