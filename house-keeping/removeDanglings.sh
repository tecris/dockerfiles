#!/bin/sh

# removes dangling images
docker rmi $(docker images -f "dangling=true" -q)

# removes dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)
