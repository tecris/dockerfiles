#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/molecule:23.06.28 \
    -f Dockerfile \
    ./
