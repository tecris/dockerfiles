#!/bin/sh

. ./imageName

docker build -t $IMAGE_NAME .
