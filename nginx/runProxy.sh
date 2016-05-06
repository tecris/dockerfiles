#!/bin/bash

docker run -d --name nginx-reverse-proxy 
    -v `pwd`/nginx.conf:/etc/nginx/conf.d/default.conf:ro 
    -p 80:80 
    nginx:1.10
