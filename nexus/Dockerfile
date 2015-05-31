FROM tecris.org:5000/jdk8

# based on https://github.com/sonatype/docker-nexus
# MAINTAINER Sonatype <cloud-ops@sonatype.com>

ENV REPO_URL=http://192.168.1.66/repo/packages

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 2.11.3-01

RUN apt-get install -y curl

RUN mkdir -p /opt/sonatype/nexus \
  && curl --fail --silent --location --retry 3 \
    ${REPO_URL}/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  | gunzip \
  | tar x -C /tmp nexus-${NEXUS_VERSION} \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

RUN useradd -r -u 200 -m -c "nexus role account" -d ${SONATYPE_WORK} -s /bin/false nexus

# VOLUME ${SONATYPE_WORK}

# ADD nexus.supervisor.conf /etc/supervisor/conf.d/nexus.conf
# ADD runNexus.sh /opt/sonatype/nexus/runNexus.sh

EXPOSE 8081
WORKDIR /opt/sonatype/nexus
USER nexus

CMD java \
  -Dnexus-work=/sonatype-work -Dnexus-webapp-context-path=/ \
  -Xms256m -Xms768m \
  -cp '/opt/sonatype/nexus/conf/:/opt/sonatype/nexus/lib/*' \
  -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true \
   org.sonatype.nexus.bootstrap.Launcher /opt/sonatype/nexus/conf/jetty.xml /opt/sonatype/nexus/conf/jetty-requestlog.xml
