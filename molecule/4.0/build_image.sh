#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/molecule:23.05.06 \
    -f Dockerfile \
    ./
