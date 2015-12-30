#!/bin/sh

# removes all containers
docker rmi $(docker images |grep casadocker|awk '{print $3}')
