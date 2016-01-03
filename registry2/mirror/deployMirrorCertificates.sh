#1/bin/bash

FQDN=registry.mirror

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN:5000
sudo cp certs/domain.crt /etc/docker/certs.d/$FQDN:5000/ca.crt

sudo mkdir -p /opt/docker_volumes/registry/$FQDN
sudo cp -r certs /opt/docker_volumes/registry/$FQDN
sudo cp -r auth  /opt/docker_volumes/registry/$FQDN
