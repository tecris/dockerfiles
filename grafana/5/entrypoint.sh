#!/usr/bin/env sh

# set -x

url="https://localhost:3000"

post() {
    curl -u $GF_SECURITY_ADMIN_USER:$GF_SECURITY_ADMIN_PASSWORD \
        -s -X POST -d "$1" \
        -H 'Content-Type: application/json;charset=UTF-8' \
        "$url$2" 2> /dev/null
}

if [ ! -f "/var/lib/grafana/.init" ]; then
    exec /run.sh $@ &

    sleep 5

    for datasource in /etc/grafana/datasources/*; do
      echo installed $datasource;
      post "$(envsubst < $datasource)" "/api/datasources"
    done

    for dashboard in /etc/grafana/dashboards/*; do
        post "$(cat $dashboard)" "/api/dashboards/db"
    done

    touch "/var/lib/grafana/.init"

    kill $(pgrep grafana)
    sleep 5
fi

exec /run.sh $@
