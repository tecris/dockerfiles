################################################################################
#
# https://github.com/frol/docker-alpine-openjdk7
#
# .) Build
# docker build -t casadocker/alpine-openjdk:8u77 .
# docker build --no-cache -t casadocker/alpine-openjdk:8u77 .
# .) Run
# docker run --name alpine-openjdk8 -it casadocker/alpine-openjdk:8u77 bash
#
################################################################################


FROM alpine:3.4

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

# https://pkgs.alpinelinux.org/package/v3.4/community/x86_64/openjdk8
RUN apk add --no-cache openjdk8=8.92.14-r1 && \
            ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"
