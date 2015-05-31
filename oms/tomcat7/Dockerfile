FROM tecris.org/tomcat7

ENV REPORTS_FILE=reports-33-SNAPSHOT.jar

RUN mkdir -p /opt/apps/nzwoms/jasperreports
RUN mkdir -p /opt/apps/nzwoms/config

ADD files/setenv.sh /usr/local/tomcat/bin/setenv.sh

ADD files/nzwood-oms.war /usr/local/tomcat/webapps/nzwood-oms.war
ADD files/oms.properties /opt/apps/nzwoms/config/oms.properties
ADD files/${REPORTS_FILE} /opt/apps/nzwoms/jasperreports/

RUN sed -i '/reports.directory=..\/reports\/target\/jasperreports/c\reports.directory=\/opt\/apps\/nzwoms\/jasperreports' /opt/apps/nzwoms/config/oms.properties

# When starting this image with --link oms-db:db, docker will create a host entry for host name 'db' in /ets/hosts
# database running on host 'nzwoodomsdb'
# either docker/docker-compose/kubernetes will create a host entry for 'nzwoodomsdb' in /etc/hosts
# docker: start container with --link db:nzwoodomsdb ( database container was started with docker run --name db ...)
# docker-compose: name database service as 'db' and add entry - db:nzwoodomsdb in the links section of the frontend service
# kubernetes: name database service as 'nzwoodomsdb'
RUN sed -i '/^jdbc.oms.url=jdbc:postgresql:\/\/localhost\/oms/c\jdbc.oms.url=jdbc:postgresql:\/\/nzwoodomsdb\/oms' /opt/apps/nzwoms/config/oms.properties

WORKDIR /opt/apps/nzwoms/jasperreports
RUN jar xf ${REPORTS_FILE}
