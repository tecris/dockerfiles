################################################################################
#
# 1. Build
# docker build --no-cache -t casadocker/trusty-ansible .
# 2. Run
# docker run --name trusty-ansible -it casadocker/trusty-ansible bash
#
################################################################################
FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
