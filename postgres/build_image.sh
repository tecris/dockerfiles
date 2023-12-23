#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    --load \
    -t org.matei/postgres:16 \
    -f Dockerfile \
    ./
