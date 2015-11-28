#!/bin/sh

# stop ALL containers
docker stop $(docker ps -a -q)
