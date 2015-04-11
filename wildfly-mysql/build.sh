#!/bin/sh

. ./imageName

docker build --no-cache -t $IMAGE_NAME .
