################################################################################
#
# based on https://github.com/tech-sketch/docker-apache-apollo
#
# .) Build
# docker build -t casadocker/apollo .
# docker build --no-cache -t casadocker/apollo .
#
# .) Run (non-secure ports)
# docker run --name apollo -p=61613:61613 -p=61623:61623 -p=61680:61680 -d -t casadocker/apollo
# .) Run (secure ports)
# docker run --name apollo -p=61614:61614 -p=61624:61624 -p=61681:61681 -d -t casadocker/apollo
#
# .) Connect
# docker exec -it apollo bash
#
# Web Admin console
# http://ip_address:61680
# login: admin
# passcode: password
#
################################################################################


FROM casadocker/jdk:8

RUN apt-get update -y \
    && apt-get install -y -q curl

ENV APACHE_APOLLO_VERSION 1.7.1
ENV APACHE_APOLLO_HOME    /opt/apache-apollo
ENV APACHE_APOLLO_USER    apollo

# Install Apache Apollo

WORKDIR /tmp

RUN curl -s -o apache-apollo.tar.gz \
        http://archive.apache.org/dist/activemq/activemq-apollo/$APACHE_APOLLO_VERSION/apache-apollo-$APACHE_APOLLO_VERSION-unix-distro.tar.gz \
    && mkdir -p $APACHE_APOLLO_HOME \
    && tar xzf  apache-apollo.tar.gz -C $APACHE_APOLLO_HOME --strip-components=1 \
    && rm       apache-apollo.tar.gz \
    && useradd -r -M -d $APACHE_APOLLO_HOME $APACHE_APOLLO_USER \
    && chown -R $APACHE_APOLLO_USER:$APACHE_APOLLO_USER $APACHE_APOLLO_HOME


# Creating a Broker Instance

WORKDIR /var/lib

RUN $APACHE_APOLLO_HOME/bin/apollo create broker

# To allow access from any interface, change the web_admin bind configuration to use 0.0.0.0 as the host in /var/lib/broker/etc/apollo.xml
RUN sed -i '/<web_admin bind="http:\/\/127.0.0.1:61680"\/>/c\<web_admin bind="http:\/\/0.0.0.0:61680"\/>' /var/lib/broker/etc/apollo.xml

EXPOSE 61680
EXPOSE 61681
EXPOSE 61613
EXPOSE 61614
EXPOSE 61623
EXPOSE 61624

ENTRYPOINT ["/var/lib/broker/bin/apollo-broker", "run"]
