################################################################################
#
# 1. Build
# docker build --no-cache -t casadocker/ansible:2.0.2 .
# 2. Run
# docker run --name ansible -it casadocker/ansible:2.0.2 bash
#
################################################################################


FROM ubuntu:14.04

# Based on https://github.com/ansible/ansible-docker-base/blob/master/stable-ubuntu14.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible=2.0.2.0-1ppa~trusty

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
