#!/bin/sh

. ./imageName

docker run --name git-server -d -p 9148:9148 -p 24:22 $IMAGE_NAME 
