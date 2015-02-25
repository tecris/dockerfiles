FROM ubuntu/jdk7

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

# set environment
ENV ORACLE_SID XE
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH $ORACLE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $ORACLE_HOME/lib

# install oracle xe
ADD ./files /tmp/filesOracle
RUN apt-get install -y alien dpkg-dev debhelper build-essential
RUN chmod +x /tmp/filesOracle/*.sh
RUN /tmp/filesOracle/install.sh


EXPOSE 1521 22 8080


CMD ["/usr/bin/supervisord"]


