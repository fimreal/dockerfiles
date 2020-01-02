FROM alpine

ENV WEBPROC_VERSION=0.2.2
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/$WEBPROC_VERSION/webproc_linux_amd64.gz

RUN wget $WEBPROC_URL \
    && gzip -cd webproc_linux_amd64.gz > /usr/local/bin/webproc \
	&& chmod +x /usr/local/bin/webproc \
	&& rm -rf webproc_linux_amd64.gz
