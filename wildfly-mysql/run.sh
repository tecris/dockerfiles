#!/bin/sh

. ./imageName

# link to container named db
docker run -d --name web --link mysqldb:mysql -p 24:22 -p 8080:8080 -p 9990:9990 $IMAGE_NAME

