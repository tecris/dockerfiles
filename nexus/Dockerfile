FROM org.tecris.ubuntu1404.util/jdk7
# FROM       dockerfile/java:oracle-java7

# based on https://github.com/sonatype/docker-nexus
# MAINTAINER Sonatype <cloud-ops@sonatype.com>

ENV REPO_URL=http://172.25.1.88/repo/packages

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 2.11.2-06

RUN mkdir -p /opt/sonatype/nexus \
  && curl --fail --silent --location --retry 3 \
    ${REPO_URL}/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  | gunzip \
  | tar x -C /tmp nexus-${NEXUS_VERSION} \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

RUN useradd -r -u 200 -m -c "nexus role account" -d ${SONATYPE_WORK} -s /bin/false nexus

VOLUME ${SONATYPE_WORK}

ADD nexus.supervisor.conf /etc/supervisor/conf.d/nexus.conf
ADD runNexus.sh /opt/sonatype/nexus/runNexus.sh

EXPOSE 8081
