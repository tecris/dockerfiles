FROM org.tecris.ubuntu1404.util/jdk8

# based on https://registry.hub.docker.com/_/tomcat/


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.61
# ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin
ENV TOMCAT_TGZ_URL http://192.168.1.66/repo/packages
RUN curl -SL "$TOMCAT_TGZ_URL/apache-tomcat-$TOMCAT_VERSION.tar.gz" -o tomcat.tar.gz \
    # && curl -SL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
    # && gpg --verify tomcat.tar.gz.asc \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz*

ADD tomcat.supervisor.conf /etc/supervisor/conf.d/tomcat.conf

EXPOSE 8080
