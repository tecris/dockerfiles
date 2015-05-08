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
ADD files/settings.xml /opt/settings.xml

RUN wget -qO- https://get.docker.com/ | sh

ADD jenkins.supervisor.conf /etc/supervisor/conf.d/jenkins.conf
ADD docker.supervisor.conf /etc/supervisor/conf.d/docker.conf
RUN mkdir ${MAVEN_HOME}
RUN chown -R jenkins:jenkins ${MAVEN_HOME} /var/lib/jenkins/plugins
RUN usermod -aG docker jenkins
