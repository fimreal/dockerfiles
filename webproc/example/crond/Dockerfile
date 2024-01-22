FROM alpine

ENV WEBPROC_VERSION=0.4.0
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/v${WEBPROC_VERSION}/webproc_${WEBPROC_VERSION}_linux_amd64.gz

RUN wget $WEBPROC_URL \
    && gzip -cd webproc_${WEBPROC_VERSION}_linux_amd64.gz > /usr/local/bin/webproc \
    && chmod +x /usr/local/bin/webproc \
    && rm -rf webproc_linux_amd64.gz

ENTRYPOINT ["/usr/local/bin/webproc", "-c", "/etc/crontabs/root", "-s", "continue", "--", "/usr/sbin/crond", "-f"]

EXPOSE 8080 53/udp
