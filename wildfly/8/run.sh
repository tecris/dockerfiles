#!/bin/sh

. ./imageName

docker run -d --name wildfly8 -p 8080:8080 -p 9990:9990 $IMAGE_NAME
