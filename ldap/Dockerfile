FROM ubuntu:14.04

RUN echo 'root:root' |chpasswd

# Install SSH - in case you need to ssh into container
RUN apt-get -y update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Install supervisor - to manage to run multiple services
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chown root /var/run && chown root /var/run/sshd
RUN chmod 755 /var/run/sshd && chmod  755 /var/run

# Install slapd 
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN echo 'slapd/root_password password password' | debconf-set-selections &&\
    echo 'slapd/root_password_again password password' | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils

ADD files /ldap

RUN service slapd start ;\
    cd /ldap &&\
	ldapadd -Y EXTERNAL -H ldapi:/// -f back.ldif &&\
	ldapadd -x -D cn=admin,dc=atlas,dc=org -w password -c -f front.ldif &&\
	ldapadd -x -D cn=admin,dc=atlas,dc=org -w password -c -f more.ldif

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 22 389


CMD ["/usr/bin/supervisord"]


