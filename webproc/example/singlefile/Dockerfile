FROM alpine

ENV WEBPROC_VERSION=0.4.0
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/v${WEBPROC_VERSION}/webproc_${WEBPROC_VERSION}_linux_amd64.gz

RUN wget $WEBPROC_URL \
    && gzip -cd webproc_${WEBPROC_VERSION}_linux_amd64.gz > /usr/local/bin/webproc \
    && chmod +x /usr/local/bin/webproc \
    && rm -rf webproc_${WEBPROC_VERSION}_linux_amd64.gz

COPY ./ep.sh /ep.sh
ENTRYPOINT ["/bin/sh","-c","/ep.sh"]

EXPOSE 8080
