#!/bin/sh

. ./imageName

docker run -d -p 23:22 -p 389:389 $IMAGE_NAME
#docker run -d -p 23:22 -p 63389:389 $IMAGE_NAME

