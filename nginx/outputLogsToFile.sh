#!/bin/bash

docker logs -f trivialis-blog > /var/log/nginx/access.log 2>/var/log/nginx/error.log
