# based on https://github.com/jboss-dockerfiles/wildfly/blob/8.2.0.Final/Dockerfile

FROM ubuntu/jdk8

RUN adduser --disabled-password --home /opt/jboss --gecos "" jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
USER jboss

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.2.0.Final

RUN wget http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz
# RUN wget  http://10.1.1.7/wildfly-8.2.0.Final.tar.gz
RUN tar -xf wildfly-$WILDFLY_VERSION.tar.gz
RUN rm wildfly-$WILDFLY_VERSION.tar.gz
RUN ln -s wildfly-$WILDFLY_VERSION wildfly

EXPOSE 8080 9990

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

RUN /opt/jboss/wildfly/bin/add-user.sh admin 1admin! --silent

RUN echo '' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo '[program:wildfly]' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'command=/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'autorestart=true' >> /etc/supervisor/conf.d/supervisord.conf
