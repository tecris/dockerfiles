#!/bin/sh

. ./imageName

docker run --name jdk7 -it $IMAGE_NAME bash
