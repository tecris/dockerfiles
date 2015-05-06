#!/bin/sh

# removes dangling images
docker rmi $(sudo docker images -f "dangling=true" -q)
