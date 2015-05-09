FROM org.tecris.ubuntu1404.util/jdk7

ENV REPO_URL http://192.168.1.66/repo/packages
ENV JENKINS_VERSION 1.612
ENV MAVEN_HOME /opt/maven
ENV MAVEN_VERSION 3.3.1

RUN wget -qO- ${REPO_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xvz -C /opt

RUN apt-get install -y daemon psmisc
RUN wget ${REPO_URL}/jenkins_${JENKINS_VERSION}_all.deb
RUN dpkg -i jenkins_${JENKINS_VERSION}_all.deb

RUN mkdir /var/lib/jenkins/plugins
RUN wget ${REPO_URL}/git-client.hpi -O /var/lib/jenkins/plugins/git-client.hpi
RUN wget ${REPO_URL}/scm-api.hpi -O /var/lib/jenkins/plugins/scm-api.hpi
RUN wget ${REPO_URL}/git.hpi -O /var/lib/jenkins/plugins/git.hpi
RUN wget ${REPO_URL}/docker-build-step.hpi -O /var/lib/jenkins/plugins/docker-build-step.hpi
# ADD files/settings.xml /opt/settings.xml
ADD files/settings.xml /var/lib/jenkins/.m2/settings.xml

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables
    
# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

RUN echo 'DOCKER_OPTS="--insecure-registry 192.168.1.66:5000"' >> /etc/default/docker
ADD jenkins.supervisor.conf /etc/supervisor/conf.d/jenkins.conf
ADD docker.supervisor.conf /etc/supervisor/conf.d/docker.conf
RUN mkdir ${MAVEN_HOME}
RUN usermod -aG docker jenkins


# demo stuff
RUN mkdir -p /opt/demo/Continuous_Delivery/docker
ADD demo/Dockerfile /opt/demo/Continuous_Delivery/docker/Dockerfile
RUN chown -R jenkins:jenkins ${MAVEN_HOME} /var/lib/jenkins /opt/demo
