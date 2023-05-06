#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/debian_11-systemd:23.05.06 \
    -f Dockerfile \
    ./
