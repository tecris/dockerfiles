#1/bin/bash

FQDN=blue.sky

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN
sudo cp certs/domain.crt /etc/docker/certs.d/$FQDN/ca.crt

sudo mkdir -p /opt/docker_volumes/registry/$FQDN
sudo cp -r certs /opt/docker_volumes/registry/$FQDN
