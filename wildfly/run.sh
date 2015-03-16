#!/bin/sh

docker run -d --name web -p 24:22 -p 8080:8080 -p 9990:9990 wildfly/base
