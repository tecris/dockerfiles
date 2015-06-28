#!/bin/sh

. ./imageName

docker stop tomcat8-ds
docker rm tomcat8-ds
docker rmi $IMAGE_NAME
