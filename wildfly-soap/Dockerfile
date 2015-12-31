################################################################################
#
# Wildfly modified to rewrite <soap:address>
# https://docs.jboss.org/author/display/AS71/Web+services+configuration
#
# .) Build
# docker build --no-cache -t casadocker/wildfly-soap:9.0.2 .
#
# .) Connect
# docker exec -it web bash
#
################################################################################


FROM casadocker/wildfly:9.0.2

USER jboss

ENV WILDFLY_VERSION 9.0.2

ADD webservices.cli /opt/jboss/webservices.cli

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/webservices.cli

# Fix for WFLYCTL0056: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current to ... 
RUN rm -rf /opt/jboss/wildfly-$WILDFLY_VERSION.Final/standalone/configuration/standalone_xml_history

USER root
