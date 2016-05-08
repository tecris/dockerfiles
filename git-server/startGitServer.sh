#!/bin/bash

docker run --name git-server -d \
    -p 2224:22 \
    -p 9418:9418 \
	-v /opt/docker_volumes/git/.ssh:/home/git/.ssh \
	-v /opt/docker_volumes/git/repositories:/opt/git/repositories \
	casadocker/git-server:16.05.08
