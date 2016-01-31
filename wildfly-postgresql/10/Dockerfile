# Wildfly image with parameterized (system properies) datasource 
#
# postgres.ipaddress - postgres database ip address
# postgres.port      - postgres port
# postgres.database  - database name
# postgres.username  - database user
# postgres.password  - database password
# Usage: -Dpostgres.ipaddress=10.1.1.4

# .) Build
# docker build --no-cache -t casadocker/wildfly-postgres:10.0.0 .
# .) Run
# link to container named postgres
# docker run -d --name web \
#	--link postgres:postgres \
#	-p 8080:8080 -p 9990:9990 \
#	casadocker/wildfly-postgres:10.0.0 \
#	-Dpostgres.ipaddress=postgres -Dpostgres.port=3306 -Dpostgres.database=db_name -Dpostgres.root_password=postgres -Dpostgres.username=root -Dpostgres.password=postgres
# .) Connect
# docker exec -it web bash


FROM casadocker/wildfly:10.0.0

USER jboss

ENV WILDFLY_VERSION 10.0.0
ENV POSTGRESQL_JDBC_DRIVER_VERSION 9.4-1206-jdbc42

RUN wget "http://central.maven.org/maven2/org/postgresql/postgresql/${POSTGRESQL_JDBC_DRIVER_VERSION}/postgresql-${POSTGRESQL_JDBC_DRIVER_VERSION}.jar" -O /opt/jboss/postgresql-${POSTGRESQL_JDBC_DRIVER_VERSION}-bin.jar

ADD datasource.cli /opt/jboss/datasource.cli
RUN sed -i -e s/POSTGRESQL-JDBC-DRIVER-VERSION/${POSTGRESQL_JDBC_DRIVER_VERSION}/g /opt/jboss/datasource.cli

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/datasource.cli

# Fix for WFLYCTL0056: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current to ... 
RUN rm -rf /opt/jboss/wildfly-$WILDFLY_VERSION.Final/standalone/configuration/standalone_xml_history

USER root

ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
