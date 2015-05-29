#!/bin/sh

. ./imageName

docker run --name tomcat7 -d -p 8080:8080 -p :22 $IMAGE_NAME
