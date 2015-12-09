#!/bin/sh

HOST=$1
FILE=$2
PARAM=@$FILE

# curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@$(pwd)/insert_oss_repository.xml" -u admin:admin123 http://$HOST:8081/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@$FILE" -u admin:admin123 http://$HOST:8081/service/local/repositories

