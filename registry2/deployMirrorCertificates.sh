#1/bin/bash

FQDN=registry.mirror

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN
sudo cp certs/$FQDN/domain.crt /etc/docker/certs.d/$FQDN:5000/ca.crt

sudo mkdir -p /opt/docker_volumes/registry/$FQDN/certs
sudo cp certs/$FQDN/* /opt/docker_volumes/registry/$FQDN/certs/
