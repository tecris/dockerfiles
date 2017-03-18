################################################################################
#
# based on https://registry.hub.docker.com/_/tomcat/
#
# .) Build
# docker build -t casadocker/tomcat:8.0.32 .
# docker build --no-cache -t casadocker/tomcat:8.0.42 .
#
# .) Run
# docker run -d --name tomcat-8 -p 8080:8080 casadocker/tomcat:8.0.42
#
################################################################################


FROM casadocker/jdk:8


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.42
ENV TOMCAT_USERS_FILE /usr/local/apache-tomcat-${TOMCAT_VERSION}/conf/tomcat-users.xml
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin
# ENV TOMCAT_TGZ_URL http://192.168.1.66/repo/packages
RUN wget -qO- "${TOMCAT_TGZ_URL}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" | tar xvz -C /usr/local
RUN ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME}

RUN sed -i 's/.*\/tomcat-users.*/  <role rolename="manager-gui"\/>\n&/' ${TOMCAT_USERS_FILE}
RUN sed -i 's/.*\/tomcat-users.*/  <role rolename="manager-script"\/>\n&/' ${TOMCAT_USERS_FILE}
RUN sed -i 's/.*\/tomcat-users.*/  <role rolename="manager-jmx"\/>\n&/' ${TOMCAT_USERS_FILE}
RUN sed -i 's/.*\/tomcat-users.*/  <role rolename="manager-status"\/>\n&/' ${TOMCAT_USERS_FILE}
RUN sed -i 's/.*\/tomcat-users.*/  <user username="admin" password="1admin!" roles="manager-gui,manager-script,manager-jmx,manager-status"\/>\n&/' ${TOMCAT_USERS_FILE}

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
