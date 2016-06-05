################################################################################
#
# .) Build
# docker build --no-cache -t casadocker/git-server:16.06.05 .
# .) Run
# docker-compose up -d
#
#
# https://github.com/bankiru/docker-git-daemon
#
################################################################################


FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y openssh-server git supervisor

# SSH
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
RUN sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UseLogin no/UseLogin no/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config


# supervisor
RUN mkdir -p /var/log/supervisor
ADD ssh.supervisor.conf /etc/supervisor/conf.d/ssh.conf
ADD git-daemon.supervisor.conf /etc/supervisor/conf.d/git-daemon.conf
RUN chown root /var/run && chown root /var/run/sshd


ENV USER git
RUN adduser --disabled-password --shell /usr/bin/git-shell --gecos "" $USER
RUN adduser $USER sudo


RUN mkdir -p /home/$USER/.ssh
RUN chmod 700 /home/$USER/.ssh
ADD files/authorized_keys /home/$USER/.ssh/authorized_keys
RUN chmod 600 /home/$USER/.ssh/authorized_keys
RUN chown -R $USER:$USER /home/$USER/.ssh
RUN mkdir -p /opt/$USER/repositories
RUN chmod 0775 /opt/$USER/repositories
RUN chown -R $USER:$USER /opt/$USER/repositories

ADD git-daemon.sh /usr/bin/git-daemon.sh

EXPOSE 22
EXPOSE 9418

CMD ["/usr/bin/supervisord"]
