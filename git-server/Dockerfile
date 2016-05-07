################################################################################
#
# .) Build
# docker build --no-cache -t casadocker/git-server:16.05.07 .
# .) Run
# ./startGitServer.sh
#
################################################################################


FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y openssh-server git

# SSH
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
RUN sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UseLogin no/UseLogin no/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

ENV USER git
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo

RUN mkdir -p /home/$USER/.ssh
RUN mkdir -p /opt/$USER/repositories
RUN chmod 0775 /opt/git/repositories
RUN chown -R $USER:$USER /opt/git/repositories

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
