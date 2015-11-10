
# .) Build
# docker build --no-cache -t org.tecris:5000/wildfly4mysql:9.0.2 .
# .) Run
# link to container named mysqldb
# docker run -d --name web \
#	--link mysqldb:mysql \
#	-p 8080:8080 -p 9990:9990 \
#	org.tecris:5000/wildfly4mysql:9.0.2 \
#	-Dmysql.ipaddress=mysqldb -Dmysql.port=3306 -Dmysql.database=db_name -Dmysql.root_password=mysql -Dmysqldb.username=root -Dmysqldb.password=mysql
# .) Connect
# docker exec -it web bash



FROM org.tecris:5000/wildfly:9.0.2

USER jboss

ENV WILDFLY_VERSION 9.0.2

ADD ./wildfly/modules/com/mysql/main/mysql-connector-java-5.1.29-bin.jar /opt/jboss/mysql-connector-java-5.1.29-bin.jar

ADD datasource.cli /opt/jboss/datasource.cli

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/datasource.cli

# Fix for WFLYCTL0056: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current to ... 
RUN rm -rf /opt/jboss/wildfly-$WILDFLY_VERSION.Final/standalone/configuration/standalone_xml_history

USER root

ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
