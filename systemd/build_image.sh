#!/bin/bash
#
set -x

if [ "$#" -ne 2 ]; then
    echo -e "Usage: $0 <os> <version>"
    echo -e "Example: $0 ubuntu 22.04"
    exit
fi

os=${1}
os_version=${2}

docker buildx build \
    --no-cache \
    --progress=plain \
    -t org.tecris/${os}_${os_version}-systemd:23.08.04 \
    -f ${os}-${os_version}/Dockerfile \
    .
