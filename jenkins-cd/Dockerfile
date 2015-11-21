
# .) Build
# docker build --no-cache -t org.tecris:5000/jenkins-cd .
# .) Run
# docker run --name jenkins --add-host maven.nexus:172.17.0.4 --restart=always -d -p 8080:8080 org.tecris:5000/jenkins-cd


FROM org.tecris:5000/jenkins-base


ENV MAVEN_VERSION 3.3.3
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}

USER jenkins

USER root

RUN mkdir -p /opt/maven_config/.m2
ADD files/settings.xml /opt/maven_config/.m2/settings.xml
RUN mkdir -p /opt/docker/dockerfiles
ADD files/Dockerfile.bookstore /opt/docker/dockerfiles/Dockerfile.bookstore
RUN tar cf /opt/docker/dockerfiles/Dockerfile.bookstore.tar.gz -C /opt/docker/dockerfiles Dockerfile.bookstore
RUN chown -R jenkins:jenkins /opt
USER jenkins


RUN wget -qO- http://www.eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-3.3.3-bin.tar.gz | tar xvz -C /opt

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
