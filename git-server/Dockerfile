################################################################################
#
# .) Build
# docker build --no-cache -t casadocker/git-server:16.05.03 .
# .) Run
# ./startGitServer.sh
#
################################################################################


FROM ubuntu:16.04

RUN echo 'root:root' |chpasswd

RUN apt-get -y update
RUN apt-get install -y openssh-server git

# SSH
RUN mkdir -p /var/run/sshd
# for now we aim for passwordless-ssh-access
# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
# RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

ENV USER git
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo

RUN mkdir -p /home/$USER/.ssh
RUN mkdir -p /opt/$USER/repositories
RUN chmod 0775 /opt/git/repositories
RUN chown -R $USER:$USER /opt/git/repositories

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
