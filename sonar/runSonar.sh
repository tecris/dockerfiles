#!/bin/sh

. ./imageName

docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 -p :22 $IMAGE_NAME
