#!/bin/sh

# removes all containers
docker rmi -f $(docker images |grep casadocker|awk '{print $3}')
