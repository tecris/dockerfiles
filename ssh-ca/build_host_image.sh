#!/bin/bash

TAG=23.05.16
docker buildx build \
    --build-arg TAG=${TAG} \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh-host:${TAG} \
    -f Dockerfile.host \
    ./
