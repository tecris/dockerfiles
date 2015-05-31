FROM tecris.org:5000/jdk8

ENV REPO_URL http://192.168.1.66/repo/packages
ENV JENKINS_VERSION 1.612
ENV MAVEN_HOME /opt/maven
ENV MAVEN_VERSION 3.3.1

RUN echo 'root:root' |chpasswd

RUN apt-get -y update
RUN apt-get install -y openssh-server supervisor wget curl telnet git

# SSH
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# supervisor
RUN mkdir -p /var/log/supervisor
ADD ssh.supervisor.conf /etc/supervisor/conf.d/ssh.conf
RUN chown root /var/run && chown root /var/run/sshd
RUN chmod 755 /var/run/sshd && chmod  755 /var/run

# maven
RUN wget -qO- ${REPO_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xvz -C /opt

RUN apt-get install -y daemon psmisc
RUN wget ${REPO_URL}/jenkins_${JENKINS_VERSION}_all.deb
RUN dpkg -i jenkins_${JENKINS_VERSION}_all.deb

RUN mkdir /var/lib/jenkins/plugins
RUN wget ${REPO_URL}/git-client.hpi -O /var/lib/jenkins/plugins/git-client.hpi
RUN wget ${REPO_URL}/scm-api.hpi -O /var/lib/jenkins/plugins/scm-api.hpi
RUN wget ${REPO_URL}/git.hpi -O /var/lib/jenkins/plugins/git.hpi
RUN wget ${REPO_URL}/docker-build-step.hpi -O /var/lib/jenkins/plugins/docker-build-step.hpi
RUN wget ${REPO_URL}/sonar.hpi -O /var/lib/jenkins/plugins/sonar.hpi
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


RUN chown -R jenkins:jenkins ${MAVEN_HOME} /var/lib/jenkins

EXPOSE 22 8080

CMD ["/usr/bin/supervisord"]

