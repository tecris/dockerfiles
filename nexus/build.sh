#!/bin/bash

. ./imageName

echo  building $IMAGE_NAME

# docker build -t $IMAGE_NAME .
docker build --no-cache -t $IMAGE_NAME .