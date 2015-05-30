FROM org.tecris/wildfly

USER jboss

# mysql datasource configuration & jdbc driver
ADD wildfly /opt/jboss/wildfly-8.2.0.Final/

USER root

# it is expected this container will be started using docker link feature to link to container running mysql (link --mysql:db)
# DB_PORT_3306_TCP_ADDR, DB_ENV_MYSQL_DATABASE are env variable created by docker when using link feature
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dmysql.ipaddress=$DB_PORT_3306_TCP_ADDR", "-Dmysql.port=3306", "-Dmysql.database=$DB_ENV_MYSQL_DATABASE"]
