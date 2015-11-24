#!/bin/sh

. ./imageName

docker run --name jenkins --restart=always -d -p 8080:8080 $IMAGE_NAME
