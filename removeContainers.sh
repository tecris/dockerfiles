#!/bin/sh

# removes all containers
docker rm $(docker ps -a -q)
