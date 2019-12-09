FROM perl:slim-stretch
LABEL maintainer "lmr@epurs.com"
ADD pt-query-digest /usr/bin/pt-query-digest
RUN chmod u+x /usr/bin/pt-query-digest
ENTRYPOINT ["/usr/bin/pt-query-digest"]
