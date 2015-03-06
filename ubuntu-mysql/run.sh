#!/bin/sh

# docker run -d -p 23:22 -p 3306:3306 ubuntu/mysql
# docker run -d -p 23:22 -p 3306:3306 ubuntu/mysql

# set container name to make use of docker linking feature 
# other containers can connect using 'docker run -d --link db:alias ...'
docker run -d --name db -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=bookstore -e MYSQL_USER=bookstore -e MYSQL_PASSWORD=1bookstore! -p 23:22 -p 3306:3306 ubuntu/mysql

