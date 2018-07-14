FROM grafana/grafana:5.2.1

USER root
RUN apt-get update && \
    apt-get install -y curl gettext-base procps && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

COPY config/grafana.ini /etc/grafana/grafana.ini
COPY config/datasources_template.yaml /tmp/datasources_template.yaml
#COPY config/dashboards /etc/grafana/dashboards
#COPY config/datasources /etc/grafana/datasources
#COPY config/datasources_template.yaml /etc/grafana/provisioning/datasources/datasources.yaml
USER grafana

ENTRYPOINT ["./entrypoint.sh"]
