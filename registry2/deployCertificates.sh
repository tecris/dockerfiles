#1/bin/bash

FQDN=casa.docker

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN
sudo cp certs/domain.crt /etc/docker/certs.d/$FQDN/ca.crt

sudo mkdir -p /usr/local/docker/certs
sudo cp certs/* /usr/local/docker/certs/
