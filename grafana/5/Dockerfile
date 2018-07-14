FROM grafana/grafana:5.2.1

USER root
RUN apt-get update && \
    apt-get install -y curl gettext-base procps && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN chown -R grafana:grafana /etc/grafana/provisioning

COPY config/grafana.ini /etc/grafana/grafana.ini
COPY config/datasources_template.yaml /tmp/datasources_template.yaml
COPY config/dashboards /var/lib/grafana/dashboards
COPY config/dashboards.yaml /etc/grafana/provisioning/dashboards/dashboards.yaml
USER grafana

ENTRYPOINT ["./entrypoint.sh"]
