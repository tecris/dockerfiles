#!/usr/bin/env sh

set -x



if [ ! -f "/var/lib/grafana/.init" ]; then
    envsubst < /tmp/datasources_template.yaml > /etc/grafana/provisioning/datasources/datasources.yaml

    touch "/var/lib/grafana/.init"
fi

exec /run.sh $@
