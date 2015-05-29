#!/bin/sh

. ./imageName

docker run -d -p :22 -p 5432:5432 $IMAGE_NAME
