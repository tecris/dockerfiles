#!/bin/sh

. ./imageName

docker run --name tomcat8 -d -p 8080:8080 $IMAGE_NAME
