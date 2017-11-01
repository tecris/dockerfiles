################################################################################
# based on https://github.com/jboss-dockerfiles/wildfly/blob/11.0.0.Final/Dockerfile
#
# .) Build
# docker build --no-cache -t casadocker/alpine-wildfly:11.0.0 .
# .) Run
# docker run -d --name alpine-wildfly11 -p 8080:8080 -p 9990:9990 casadocker/alpine-wildfly:11.0.0
# .) Connect
# docker exec -it wildfly-11 bash
# .) Remove
# docker rmi casadocker/alpine-wildfly:11.0.0
#
################################################################################


FROM openjdk:8-alpine

RUN mkdir -p /opt/jboss

RUN adduser -D -h /opt/jboss jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
# USER jboss

# ENV REPO_URL 192.168.1.69:88

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 11.0.0.Final
ENV WILDFLY_SHA1 0e89fe0860a87bfd6b09379ee38d743642edfcfb


ENV DOWNLOAD_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION

RUN apk add --update curl && \
            rm -rf /var/cache/apk/*

RUN curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
       && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
       && tar xz -f wildfly-$WILDFLY_VERSION.tar.gz \
       && rm wildfly-$WILDFLY_VERSION.tar.gz

RUN ln -s wildfly-$WILDFLY_VERSION wildfly

EXPOSE 8080 9990

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

# add management user (username: admin, passwd: 1admin!)
RUN /opt/jboss/wildfly/bin/add-user.sh admin 1admin! --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
