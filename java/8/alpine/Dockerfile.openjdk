################################################################################
#
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/
# https://hub.docker.com/r/anapsix/alpine-java/~/dockerfile/
#
# .) Build
# docker build -t casadocker/alpine-openjdk:8u72 .
# docker build --no-cache -t casadocker/alpine-openjdk:8u72 .
# .) Run
# docker run --name alpine-openjdk8 -it casadocker/alpine-openjdk:8u72 bash
#
################################################################################


FROM alpine:3.3

ENV JAVA_HOME=/usr/lib/jvm/default-jvm

RUN apk add --no-cache openjdk8 && \
            ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/"
