FROM ubuntu:14.04

RUN echo 'root:root' |chpasswd

# SSH
RUN apt-get -y update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chown root /var/run && chown root /var/run/sshd
RUN chmod 755 /var/run/sshd && chmod  755 /var/run

RUN mkdir /root/.ssh
ADD files/id_rsa.pub /root/.ssh/authorized_keys
# wget
RUN apt-get install -y wget

EXPOSE 22 


CMD ["/usr/bin/supervisord"]


