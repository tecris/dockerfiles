# based on https://github.com/jboss-dockerfiles/wildfly/blob/8.2.0.Final/Dockerfile

FROM org.tecris.ubuntu1404.util/jdk8

RUN adduser --disabled-password --home /opt/jboss --gecos "" jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
USER jboss

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.2.0.Final

# ENV DOWNLOAD_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION
ENV DOWNLOAD_URL=http://172.25.1.88/repo/packages

RUN wget ${DOWNLOAD_URL}/wildfly-$WILDFLY_VERSION.tar.gz
# RUN wget  http://10.1.1.7/wildfly-8.2.0.Final.tar.gz
RUN tar -xf wildfly-$WILDFLY_VERSION.tar.gz
RUN rm wildfly-$WILDFLY_VERSION.tar.gz
RUN ln -s wildfly-$WILDFLY_VERSION wildfly

EXPOSE 8080 9990

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

# add management user (username: admin, passwd: 1admin!)
RUN /opt/jboss/wildfly/bin/add-user.sh admin 1admin! --silent

ADD wildfly.supervisor.conf /etc/supervisor/conf.d/wildfly.conf
