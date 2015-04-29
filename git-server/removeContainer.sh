#!/bin/sh

. ./imageName

docker stop git-server
docker rm git-server
