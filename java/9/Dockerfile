# docker build -t casadocker/jdk:9 .
FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y net-tools curl software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  add-apt-repository -y ppa:ansible/ansible && \
  apt-get update && \
  echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get install -y oracle-java9-installer ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
