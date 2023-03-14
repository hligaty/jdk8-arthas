FROM ubuntu:22.04

LABEL maintainer=hligaty

ENV file.encoding=UTF-8
ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai

ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:8 $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=hengyunabc/arthas:3.6.7-no-jdk /opt/arthas /opt/arthas

RUN apt-get update \
    && apt-get install -y --no-install-recommends language-pack-zh-hans vim tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
