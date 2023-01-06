# cosfs
FROM alpine:3.16 as cmdbuild
ENV COSFS_VERSION=1.0.20
ENV OSSFS_VERSION=1.80.6

RUN apk --update --no-cache add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev bash mailcap
RUN cd /tmp && wget https://github.com/tencentyun/cosfs/archive/v${COSFS_VERSION}.tar.gz &&\
    tar xf v${COSFS_VERSION}.tar.gz &&\
    cd cosfs-${COSFS_VERSION} &&\
    ./autogen.sh &&\
    ./configure --prefix=/usr &&\
    make && make install
RUN cd /tmp && wget https://github.com/aliyun/ossfs/archive/refs/tags/v${OSSFS_VERSION}.tar.gz &&\
    tar xf v${OSSFS_VERSION}.tar.gz &&\
    cd ossfs-${OSSFS_VERSION} &&\
    ./autogen.sh &&\
    ./configure --prefix=/usr &&\
    make && make install

FROM alpine:3.16
# geesefs for s3
ADD https://github.com/yandex-cloud/geesefs/releases/latest/download/geesefs-linux-amd64 /usr/bin/geesefs
COPY --from=cmdbuild /usr/bin/cosfs /usr/bin/cosfs
COPY --from=cmdbuild /usr/bin/ossfs /usr/bin/ossfs
# cosfs & ossfs runtime needed lib packages
RUN apk --no-cache add \
    ca-certificates \
    mailcap \
    fuse \
    libxml2 \
    libcurl \
    libgcc \
    libstdc++ \
    tini &&\
    chmod 755 /usr/bin/geesefs
ENTRYPOINT ["/usr/bin/geesefs"]
