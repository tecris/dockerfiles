FROM casa.docker/wildfly-mysql:9.0.2

ENV MAVEN_GROUP_ID org.terra
ENV MAVEN_ARTIFACT_ID planet

ENV MAVEN_REPOSITORY_URL 172.17.0.1

RUN wget "http://${MAVEN_REPOSITORY_URL}:8081/service/local/artifact/maven/redirect?r=snapshots&g=${MAVEN_GROUP_ID}&a=${MAVEN_ARTIFACT_ID}&v=LATEST&e=war" -O /opt/jboss/wildfly/standalone/deployments/planet.war 
