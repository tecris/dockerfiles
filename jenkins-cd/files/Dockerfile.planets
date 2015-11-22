FROM org.tecris:5000/wildfly-mysql:9.0.2

ENV MAVEN_GROUP_ID org.planets
ENV MAVEN_ARTIFACT_ID planets

ENV MAVEN_REPOSITORY_URL 172.17.0.2

RUN wget "http://${MAVEN_REPOSITORY_URL}:8081/service/local/artifact/maven/redirect?r=snapshots&g=${MAVEN_GROUP_ID}&a=${MAVEN_ARTIFACT_ID}&v=LATEST&e=war" -O /opt/jboss/wildfly/standalone/deployments/planets.war 
