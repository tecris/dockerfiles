#!/bin/bash
#
TAG=23.05.16
docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh:${TAG} \
    -f Dockerfile.ssh \
    ./
