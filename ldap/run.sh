#!/bin/sh

docker run -d -p 24:22 -p 389:389 ubuntu/ldap
#docker run -d -p 23:22 -p 63389:389 ubuntu/ldap

