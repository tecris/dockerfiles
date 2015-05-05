#!/bin/sh

. ./imageName

docker run --name jenkins -d -p 23:22 -p 8080:8080 $IMAGE_NAME
