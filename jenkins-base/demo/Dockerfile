FROM 192.168.1.66:5000/wildfly82

RUN wget "http://192.168.1.66:8081/service/local/artifact/maven/redirect?r=snapshots&g=org.tecris.sample&a=rest.jax-rs&p=war&v=LATEST" -O /opt/jboss/wildfly/standalone/deployments/ROOT.war

