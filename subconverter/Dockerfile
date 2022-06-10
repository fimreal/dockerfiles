FROM alpine

ENV SUBCONVERTER_VERSION=0.7.2
ENV SUBCONVERTER_URL https://github.com/tindy2013/subconverter/releases/download/v${SUBCONVERTER_VERSION}/subconverter_linux64.tar.gz

RUN wget $SUBCONVERTER_URL \
    && tar xf subconverter_linux64.tar.gz -C /usr/local/ \
    && rm subconverter_linux64.tar.gz

EXPOSE 25500

CMD ["/usr/local/subconverter/subconverter"]
