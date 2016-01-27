################################################################################
#
# 1. Build
# docker build --no-cache -t casadocker/ansible .
# 2. Run
# docker run --name ansible -it casadocker/ansible bash
# 3. Remove image
# docker rmi casadocker/ansible
#
################################################################################


FROM ubuntu:14.04

# Based on https://github.com/ansible/ansible-docker-base/blob/master/stable-ubuntu14.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
