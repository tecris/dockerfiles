#1/bin/bash

FQDN=cache.registry

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN
sudo cp certs/domain.crt /etc/docker/certs.d/$FQDN/ca.crt

sudo mkdir -p /opt/docker_volumes/registry/certs
sudo cp certs/* /opt/docker_volumes/registry/certs/
