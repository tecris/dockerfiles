#!/bin/sh

. ./imageName

docker run --name git-server -d -p 24:22 -v /datadrive/git/repositories:/opt/git/repositories $IMAGE_NAME 
