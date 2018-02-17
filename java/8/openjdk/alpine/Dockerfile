# 31-Mar-2017
# To be discontinued in favour of: https://github.com/docker-library/openjdk/blob/master/8-jdk/alpine/Dockerfile

################################################################################
#
# https://github.com/frol/docker-alpine-openjdk7
#
# .) Build
# docker build -t casadocker/alpine-openjdk:8u131 .
# docker build --no-cache -t casadocker/alpine-openjdk:8u131 .
# .) Run
# docker run --name alpine-openjdk8 -it casadocker/alpine-openjdk:8u131 bash
#
################################################################################


FROM alpine:3.7

# install default packages
RUN packages=' \
    bash \
    curl \
    ca-certificates \
    sed \
    tar \
    wget \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

# https://pkgs.alpinelinux.org/package/v3.7/community/x86_64/openjdk8
RUN apk add --no-cache openjdk8=8.151.12-r0 && \
            ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"
