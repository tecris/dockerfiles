#!/bin/sh

. ./imageName

docker run -d -p 23:22 $IMAGE_NAME
