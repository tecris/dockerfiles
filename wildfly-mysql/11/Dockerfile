################################################################################
#
# Wildfly image with parameterized (system properties) datasource 
#
# mysql.ipaddress - mysql database ip address
# mysql.port      - mysql port
# mysql.database  - database name
# mysql.username  - database user
# mysql.password  - database password
# Usage: -Dmysql.ipaddress=10.1.1.4
#
# .) Build
# docker build --no-cache -t casadocker/wildfly-mysql:11.0.0 .
# .) Run
# link to container named mysqldb
# docker run -d --name web \
#	--link mysqldb:mysql \
#	-p 8080:8080 -p 9990:9990 \
#	casadocker/wildfly-mysql:11.0.0 \
#	-Dmysql.ipaddress=mysqldb -Dmysql.port=3306 -Dmysql.database=db_name -Dmysql.root_password=mysql -Dmysql.username=root -Dmysql.password=mysql
# .) Connect
# docker exec -it web bash
#
################################################################################


FROM casadocker/wildfly:11.0.0


ENV WILDFLY_VERSION 11.0.0
ENV MYSQL_CONNECTOR_VERSION 5.1.38

RUN wget "http://central.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar" -O /opt/jboss/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}-bin.jar

# this is to fix "Deploying non-JDBC-compliant driver class"
RUN mkdir -p META-INF/services
RUN echo "com.mysql.jdbc.Driver" > META-INF/services/java.sql.Driver 
RUN jar uf /opt/jboss/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}-bin.jar META-INF

ADD datasource.cli /opt/jboss/datasource.cli
RUN sed -i -e s/MYSQL-CONNECTOR-VERSION/${MYSQL_CONNECTOR_VERSION}/g /opt/jboss/datasource.cli

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/datasource.cli

# Fix for WFLYCTL0056: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current to ... 
RUN rm -rf /opt/jboss/wildfly-$WILDFLY_VERSION.Final/standalone/configuration/standalone_xml_history


ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
