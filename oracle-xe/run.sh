#!/bin/sh

. ./imageName

docker run -d -p :22 $IMAGE_NAME
