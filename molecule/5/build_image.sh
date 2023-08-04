#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/molecule:23.08.04 \
    -f Dockerfile \
    ./
