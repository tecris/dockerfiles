#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-set-up-password-authentication-with-nginx-on-ubuntu-14-04

docker run -d --name nginx-reverse-proxy \
    -v `pwd`/nginx.conf:/etc/nginx/conf.d/default.conf:ro \
    -v `pwd`/nginx.htpasswd:/etc/nginx/.htpasswd:ro  \
    -p 80:80 \
    nginx:1.10
