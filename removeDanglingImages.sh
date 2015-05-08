#!/bin/sh

# removes dangling images
docker rmi $(docker images -f "dangling=true" -q)
