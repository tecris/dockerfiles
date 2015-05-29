#!/bin/sh

. ./imageName

docker run --name nexus -d -p :22 -p 8081:8081 $IMAGE_NAME 
