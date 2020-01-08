FROM alpine:3.3

ENV COSFS_VERSION=1.0.14

RUN apk --update --no-cache add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev bash mailcap &&\
    cd /tmp &&\
    wget https://github.com/tencentyun/cosfs/archive/v${COSFS_VERSION}.tar.gz &&\
    tar xf v${COSFS_VERSION}.tar.gz &&\
    cd cosfs-${COSFS_VERSION} &&\
    ./autogen.sh &&\
    ./configure --prefix=/usr &&\
    make &&\
    make install &&\
    make clean &&\
    rm -rf /var/cache/apk/* /tmp/* &&\
    apk del automake autoconf
