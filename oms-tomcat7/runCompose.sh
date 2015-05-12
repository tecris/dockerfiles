#!/bin/sh

# --no-recreate will 
# a) reuse existing containers, and,
# b) create missing containers
docker-compose up --no-recreate -d

# fresh start
# docker-compose up -d

# stop web container
# docker-compose stop web

# remove web container
# docker-compose rm web
