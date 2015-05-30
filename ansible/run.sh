#!/bin/sh

. ./imageName

docker run --name ansible -it $IMAGE_NAME bash
