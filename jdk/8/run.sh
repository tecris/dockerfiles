#!/bin/sh

. ./imageName

docker run --name jdk8 -it $IMAGE_NAME bash
