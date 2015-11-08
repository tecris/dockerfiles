
# .) Build
docker build --no-cache -t org.tecris:5000/wildfly4mysql:9.0.2 .
# .) Build
# link to container named mysqldb
# docker run -d --name web \
#	--link mysqldb:mysql \
#	-p 8080:8080 -p 9990:9990 \
#	org.tecris:5000/wildfly4mysql:9.0.2 \
#	-Dmysql.ipaddress=mysqldb -Dmysql.port=3306 -Dmysql.database=db_name -Dmysql.root_password=mysql
# .) Connect
# docker exec -it web bash



FROM org.tecris:5000/wildfly:9.0.2

USER jboss

ENV WILDFLY_VERSION 9.0.2

# mysql datasource configuration & jdbc driver
ADD wildfly /opt/jboss/wildfly-$WILDFLY_VERSION.Final/

USER root

# it is expected this container will be started using docker link feature to link to container running mysql (link --mysql:mysqldb)
# MYSQL_PORT_3306_TCP_ADDR, MYSQL_ENV_MYSQL_DATABASE are env variable created by docker when using link feature
ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
