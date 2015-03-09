#!/bin/sh

docker run --name omswood-web --link oms-db:db -d -p 24:22 -p 8080:8080 omswood/tomcat7
