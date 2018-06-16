################################################################################
#
# 1. Build
# docker build --no-cache -t casadocker/beaver-ansible .
# 2. Run
# docker run --name xenial-ansible -it casadocker/beaver-ansible bash
# docker run -it --rm -v `pwd`:/tmp casadocker/beaver-ansible ansible-vault create /tmp/data.yaml
# docker run -it --rm -v `pwd`:/tmp casadocker/beaver-ansible ansible-vault edit /tmp/data.yaml
#
################################################################################
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible vim

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
