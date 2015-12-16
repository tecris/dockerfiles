#!/bin/sh

# removes dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)
