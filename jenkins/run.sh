#!/bin/sh

. ./imageName

docker run --privileged --name jenkins --restart=always -d -p 23:22 -p 8080:8080 $IMAGE_NAME
