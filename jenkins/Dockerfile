################################################################################
#
# .) Build
# docker build --no-cache -t casadocker/jenkins:1.642.2 .
# .) Run
# docker run --name jenkins-cd --add-host docker.host:192.168.1.68 \
#    --restart=always -d -p 8088:8080 casadocker/jenkins:1.642.1
#
################################################################################


FROM jenkins:1.642.2


ENV MAVEN_VERSION 3.3.9
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}

USER root
RUN chown -R jenkins:jenkins /opt
USER jenkins

RUN mkdir -p /opt/maven_config/.m2
ADD files/settings.xml /opt/maven_config/.m2/settings.xml

COPY config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY config/jenkins.mvn.GlobalMavenConfig.xml  /usr/share/jenkins/ref/jenkins.mvn.GlobalMavenConfig.xml
COPY config/org.jenkinsci.plugins.dockerbuildstep.DockerBuilder.xml /usr/share/jenkins/ref/org.jenkinsci.plugins.dockerbuildstep.DockerBuilder.xml

RUN wget -qO- http://www.eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xvz -C /opt

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
