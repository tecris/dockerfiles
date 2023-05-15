#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh-honey-pot:23.05.15 \
    -f Dockerfile \
    ./


#docker build  -t ssh-honey ./
