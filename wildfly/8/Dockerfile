# based on https://github.com/jboss-dockerfiles/wildfly/blob/8.2.0.Final/Dockerfile


# .) Build
# docker build --no-cache -t casadocker/wildfly:8.2.1 .
# .) Run
# docker run -d --name wildfly8 -p 8080:8080 -p 9990:9990 casadocker/wildfly:8.2.1
# .) Connect
# docker exec -it wildfly8 bash
# .) Remove
# docker rmi casadocker/wildfly:8.2.1


FROM casadocker/jdk:8

RUN adduser --disabled-password --home /opt/jboss --gecos "" jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
USER jboss

ENV REPO_URL 192.168.1.69:88

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.2.1.Final

# ENV DOWNLOAD_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION
ENV DOWNLOAD_URL=http://$REPO_URL/repo/packages

RUN wget ${DOWNLOAD_URL}/wildfly-$WILDFLY_VERSION.tar.gz
RUN tar -xf wildfly-$WILDFLY_VERSION.tar.gz
RUN rm wildfly-$WILDFLY_VERSION.tar.gz
RUN ln -s wildfly-$WILDFLY_VERSION wildfly

EXPOSE 8080 9990

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

# add management user (username: admin, passwd: 1admin!)
RUN /opt/jboss/wildfly/bin/add-user.sh admin 1admin! --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
