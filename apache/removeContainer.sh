#!/bin/sh

. ./imageName

docker stop apache2
docker rm apache2
