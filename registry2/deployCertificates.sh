#1/bin/bash

FQDN=org.tecris:5000

echo $FQDN

# -- Configure docker to trust it
sudo mkdir -p /etc/docker/certs.d/$FQDN
sudo cp certs/domain.crt /etc/docker/certs.d/$FQDN/ca.crt

sudo mkdir /usr/local/docker/certs
sudo cp certs/* /usr/local/docker/certs/
