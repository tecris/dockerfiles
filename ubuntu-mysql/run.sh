#!/bin/sh

docker run -d -p 23:22 -p 3306:3306 ubuntu/mysql
#docker run -d -p 23:22 -p 63389:389 ubuntu/ldap

