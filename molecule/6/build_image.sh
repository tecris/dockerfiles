#!/bin/bash

IMAGE_NAME=org.tecris/molecule6:23.11.04

docker buildx build \
    --no-cache \
    --progress=plain \
    -t ${IMAGE_NAME} \
    -f Dockerfile \
    ./

docker buildx build \
    --load \
    -t ${IMAGE_NAME} \
    ./

