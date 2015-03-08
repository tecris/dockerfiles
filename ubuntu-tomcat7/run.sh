#!/bin/sh

docker run --name tomcat7 -d -p 8080:8080 -p 23:22 ubuntu/tomcat7

