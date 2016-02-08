################################################################################
#
# .) Build
# docker build -t casadocker/jdk:8 .
# docker build --no-cache -t casadocker/jdk:8 .
# .) Run
# docker run --name jdk8 -it casadocker/jdk:8 bash
#
################################################################################

FROM ubuntu:14.04

# Install Java 8
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y software-properties-common
RUN apt-add-repository ppa:webupd8team/java -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install oracle-java8-installer -y && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
