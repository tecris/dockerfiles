#!/bin/sh

. ./imageName

docker run --name omswood-web --link oms-db:db -d -p :22 -p 8080:8080 $IMAGE_NAME
