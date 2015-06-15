#!/bin/sh

. ./imageName

docker run --name apache2 --restart=always -d -p 88:80 -v /var/www/html:/var/www/html $IMAGE_NAME 
