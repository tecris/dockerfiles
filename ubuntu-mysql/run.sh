#!/bin/sh

# set container name to make use of docker linking feature 
# other containers can connect using 'docker run -d --link mysqldb:alias ...'
docker run -d --name mysqldb -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=bookstore -e MYSQL_USER=bookstore -e MYSQL_PASSWORD=1bookstore! -p 23:22 -p 3306:3306 ubuntu/mysql57

