#!/bin/sh

# --no-recreate will 
# a) reuse existing containers, and,
# b) create missing containers
docker-compose up --no-recreate -d

# fresh start
# docker-compose up -d
