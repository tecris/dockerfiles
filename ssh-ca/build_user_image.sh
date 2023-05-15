#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh-user:23.05.15 \
    -f Dockerfile.user \
    ./
