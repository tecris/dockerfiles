# docker build -t trivialis/kafka:1.1.0 ./
FROM openjdk:8-jre-alpine

ENV KAFKA_VERSION 1.1.0
ENV SCALA_VERSION 2.12
ENV KAFKA_HOME /usr/local/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin

# install default packages
RUN packages=' \
    bash \
    curl \
    ca-certificates \
    sed \
    tar \
    snappy-dev \
    wget \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

RUN wget -qO- http://www-eu.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar xvz -C /usr/local

RUN ln -s /usr/local/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME}

EXPOSE 9092
