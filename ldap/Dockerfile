
# .) Build
# docker build --no-cache -t casa.docker/ldap .
# .) Run
# docker run --name ldap -d -p 63389:389 casa.docker/ldap
# .) Connect
# docker exec -it ldap bash

FROM ubuntu:14.04

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


EXPOSE 389

ENTRYPOINT ["slapd", "-h", "ldap:/// ldapi:///", "-g", "openldap", "-u", "openldap", "-F", "/etc/ldap/slapd.d", "-d", "stats"]
