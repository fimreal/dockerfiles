FROM alpine as builder

ENV PGRMAN_URL https://github.com/ossc-db/pg_rman

RUN apk add git make postgresql-dev gcc musl-utils libc-dev zlib-dev readline-dev \
    && git clone https://github.com/ossc-db/pg_rman \
    && cd pg_rman \
    && make && make install


FROM alpine
RUN apk add --no-cache postgresql-libs

COPY --from=builder  /usr/libexec/postgresql14/pg_rman /usr/sbin/pg_rman

CMD ["/usr/sbin/pg_rman"]
