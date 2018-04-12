#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-set-up-password-authentication-with-nginx-on-ubuntu-14-04

docker run -d --name trivialis-blog \
    -v `pwd`/nginx.conf:/etc/nginx/conf.d/default.conf:ro \
    -v /etc/letsencrypt/live/domain.org/fullchain.pem:/etc/letsencrypt/fullchain.pem:ro \
    -v /etc/letsencrypt/live/domain.org/privkey.pem:/etc/letsencrypt/privkey.pem:ro \
    -v /opt/blog:/etc/nginx/html:ro \
    -p 443:443 \
    nginx
