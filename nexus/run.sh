#!/bin/sh

. ./imageName

docker run --name nexus -d -p 8081:8081 $IMAGE_NAME 
