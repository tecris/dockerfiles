################################################################################
# based on https://github.com/jboss-dockerfiles/wildfly/blob/8.2.0.Final/Dockerfile
#
# .) Build
# docker build --no-cache -t casadocker/alpine-wildfly:10.0.0 .
# .) Run
# docker run -d --name alpine-wildfly10 -p 8080:8080 -p 9990:9990 casadocker/alpine-wildfly:10.0.0
# .) Connect
# docker exec -it wildflyxs-10 bash
# .) Remove
# docker rmi casadocker/alpine-wildfly:10.0.0
#
################################################################################


FROM casadocker/alpine-jdk:8u72

RUN mkdir -p /opt/jboss

RUN adduser -D -h /opt/jboss jboss 

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
# USER jboss

# ENV REPO_URL 192.168.1.69:88

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 10.0.0.Final
ENV WILDFLY_SHA1 c0dd7552c5207b0d116a9c25eb94d10b4f375549

ENV DOWNLOAD_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION
# ENV DOWNLOAD_URL=http://$REPO_URL/repo/packages

RUN apk add --no-cache --virtual=build-dependencies curl tar ca-certificates && \
       curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
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
