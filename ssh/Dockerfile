################################################################################
#
# DEMO HOW TO USE SUPERVISOR, SSH CONFIGURED TO ALLOW ROOT LOGIN
#
# 1. Build
# docker build --no-cache -t casadocker/supervisor-ssh:16.05 .
# 2. Run
# docker run -d --name ssh-supervisor -p 2224:22 casadocker/supervisor-ssh:16.05
# ssh -p 2224 root@localhost
#
################################################################################


FROM ubuntu:16.04

RUN echo 'root:root' |chpasswd

RUN apt-get -y update
RUN apt-get install -y openssh-server supervisor wget curl telnet git

# SSH
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# supervisor
RUN mkdir -p /var/log/supervisor
ADD ssh.supervisor.conf /etc/supervisor/conf.d/ssh.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
