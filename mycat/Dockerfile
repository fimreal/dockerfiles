FROM alpine as dl
ENV MYCAT_VERSION=1.21
ENV MYCAT_URL http://dl.mycat.org.cn/2.0
RUN wget $MYCAT_URL/install-template/mycat2-install-template-$MYCAT_VERSION.zip &&\
    unzip mycat2-install-template-$MYCAT_VERSION.zip -d / &&\
    chmod u+x /mycat/bin/* &&\
    wget http://dl.mycat.org.cn/2.0/$MYCAT_VERSION-release/mycat2-$MYCAT_VERSION-release-jar-with-dependencies.jar -P /mycat/lib/

FROM openjdk:8-jre
# mycat 2.x release 版本 jar 缓存下载地址: http://dl.mycat.org.cn/2.0/
ENV MYCAT_VERSION=1.21
ENV MYCAT_URL http://dl.mycat.org.cn/2.0
# 可选
# RUN apt update && apt install default-mysql-client -y
# 必须! 启动脚本依赖获取进程命令
RUN apt update && apt install procps -y && apt clean
COPY Dockerfile /Dockerfile
COPY --from=dl /mycat /mycat
WORKDIR /mycat
ENTRYPOINT  ["/mycat/bin/mycat","console"]
VOLUME /mycat/conf
