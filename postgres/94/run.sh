#!/bin/sh

. ./imageName

# set container name to make use of docker linking feature 
docker run -d --name postgres94 \
        -e POSTGRES_PASSWORD=1planets! \
        -e POSTGRES_USER=planets \
        -e POSTGRES_DB=planetsdb \
	-p 5432:5432 \
	 $IMAGE_NAME

