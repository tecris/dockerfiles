#!/bin/sh

# docker run -d -p 23:22 -p 3306:3306 ubuntu/mysql
# docker run -d -p 23:22 -p 3306:3306 ubuntu/mysql

# set container name to make use of docker linking feature 
# other containers can connect using 'docker run -d --link db:db ...'
docker run -d --name web -p 24:22 -p 8080:8080 -p 9990:9990 wildfly/base

