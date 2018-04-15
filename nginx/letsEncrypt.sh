#!/bin/bash

sudo docker run -it --rm --name certbot \
  -p 80:80 \
  -v "/etc/letsencrypt:/etc/letsencrypt" \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  certbot/certbot certonly --standalone -d domain.org \
  --text --agree-tos \
  --email eugen@cristea.org \
  --server https://acme-v01.api.letsencrypt.org/directory \
  --rsa-key-size 4096 --verbose --renew-by-default \
  --preferred-challenges http
