#!/bin/sh

. ./imageName

# docker build -t $IMAGE_NAME .
docker build --no-cache -t $IMAGE_NAME .
