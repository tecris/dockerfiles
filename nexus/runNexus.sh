#!/bin/bash
cd /opt/sonatype/nexus && sudo -u nexus java \
  -Dnexus-work=/sonatype-work -Dnexus-webapp-context-path=/ \
  -Xms256m -Xms768m \
  -cp '/opt/sonatype/nexus/conf/:/opt/sonatype/nexus/lib/*' \
  -server -XX:MaxPermSize=192m -Djava.net.preferIPv4Stack=true \
  org.sonatype.nexus.bootstrap.Launcher /opt/sonatype/nexus/conf/jetty.xml /opt/sonatype/nexus/conf/jetty-requestlog.xml
