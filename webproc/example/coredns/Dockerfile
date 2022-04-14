FROM alpine

ENV WEBPROC_VERSION=0.4.0
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/v${WEBPROC_VERSION}/webproc_${WEBPROC_VERSION}_linux_amd64.gz
ENV COREDNS_VERSION=1.9.0
ENV COREDNS_URL https://github.com/coredns/coredns/releases/download/v${COREDNS_VERSION}/coredns_${COREDNS_VERSION}_linux_amd64.tgz

RUN wget $WEBPROC_URL \
    && gzip -cd webproc_${WEBPROC_VERSION}_linux_amd64.gz > /usr/local/bin/webproc \
    && chmod +x /usr/local/bin/webproc \
    && rm -rf webproc_linux_amd64.gz

RUN wget $COREDNS_URL \
    && tar xf coredns_${COREDNS_VERSION}_linux_amd64.tgz -C /usr/local/bin/ \
    && rm -rf coredns_${COREDNS_VERSION}_linux_amd64.tgz

ENTRYPOINT ["/usr/local/bin/webproc", "-c", "/corefile", "-s", "continue", "--", "/usr/local/bin/coredns", "-conf", "/corefile"]

EXPOSE 8080 53/udp
