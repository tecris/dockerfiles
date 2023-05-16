#!/bin/bash
#
TAG=${1}
docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh:${TAG} \
    -f Dockerfile.ssh \
    ./
