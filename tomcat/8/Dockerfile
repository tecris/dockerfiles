##################### DOCU #####################
#
#
# .) Build
# docker build -t casa.docker/tomcat:8.0.30 .
# docker build --no-cache -t casa.docker/tomcat:8.0.30 .
# .) Run
# docker run -d --name tomcat-8 -p 8080:8080 casa.docker/tomcat:8.0.30
# .) Connect
# docker exec -it tomcat-8 bash


FROM casa.docker/jdk:8

# based on https://registry.hub.docker.com/_/tomcat/


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.30
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin
# ENV TOMCAT_TGZ_URL http://192.168.1.66/repo/packages
RUN wget -qO- "${TOMCAT_TGZ_URL}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" | tar xvz -C /usr/local
RUN ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME}

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
