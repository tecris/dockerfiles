#!/bin/bash

. ./imageName

docker run -d -p :22 -p 5222:5222 -p 5223:5223 -p 9090:9090 -t $IMAGE_NAME
