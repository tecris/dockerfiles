FROM org.tecris.ubuntu1404.util/jdk7

RUN wget -qO- https://get.docker.com/ | sh

RUN apt-get install -y daemon psmisc
RUN wget http://192.168.1.66/repo/packages/jenkins_1.596.2_all.deb
RUN dpkg -i jenkins_1.596.2_all.deb 

ADD jenkins.supervisor.conf /etc/supervisor/conf.d/jenkins.conf
ADD docker.supervisor.conf /etc/supervisor/conf.d/docker.conf
