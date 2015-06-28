#!/bin/sh

. ./imageName

docker run --name tomcat8-ds --link mysqldb:db -d -p 8080:8080 -v /home/tecris/workspace/docker/tomcat8-ds:/opt $IMAGE_NAME
