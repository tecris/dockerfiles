
# .) Build
# docker build --no-cache -t org.tecris:5000/jenkins-cd .
# .) Run
# docker run --name jenkins --restart=always -d -p 8080:8080 org.tecris:5000/jenkins-cd


FROM org.tecris:5000/jenkins-base

ENV MAVEN_VERSION 3.3.3
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}

USER root
RUN wget -qO- http://www.eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-3.3.3-bin.tar.gz | tar xvz -C /opt
RUN chown -R jenkins:jenkins /opt/apache-maven-${MAVEN_VERSION}
USER jenkins

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt


