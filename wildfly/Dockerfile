# Use latest jboss/base-jdk:7 image as the base
FROM ubuntu/ssh

RUN adduser --disabled-password --home /opt/jboss --gecos "" jboss

# RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Specify the user which should be used to execute all commands below
USER jboss

RUN touch a
