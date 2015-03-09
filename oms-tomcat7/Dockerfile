FROM ubuntu/tomcat7

RUN mkdir -p /opt/apps/nzwoms/jasperreports
RUN mkdir -p /opt/apps/nzwoms/config

ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD nzwood-oms.war /usr/local/tomcat/webapps/nzwood-oms.war
ADD oms.properties /opt/apps/nzwoms/config/oms.properties
RUN sed -i '/reports.directory=..\/reports\/target\/jasperreports/c\reports.directory=\/opt\/apps\/nzwoms\/jasperreports' /opt/apps/nzwoms/config/oms.properties
RUN sed -i '/^jdbc.oms.url=jdbc:postgresql:\/\/localhost\/oms/c\jdbc.oms.url=jdbc:postgresql:\/\/db\/oms' /opt/apps/nzwoms/config/oms.properties
