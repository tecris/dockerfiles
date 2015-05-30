#!/bin/sh

. ./imageName

docker run --name ldap -d -p 389:389 $IMAGE_NAME
#docker run --name ldap -d -p 23:22 -p 63389:389 $IMAGE_NAME

