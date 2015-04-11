FROM org.tecris.ubuntu1404/util

RUN echo 'root:root' |chpasswd

RUN apt-get -y update


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

ADD ldap.supervisord.conf /etc/supervisor/conf.d/ldap.conf


EXPOSE 22 389


CMD ["/usr/bin/supervisord"]


