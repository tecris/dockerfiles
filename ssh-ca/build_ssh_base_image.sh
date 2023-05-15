#!/bin/bash

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/ssh:23.05.15 \
    -f Dockerfile.ssh \
    ./


