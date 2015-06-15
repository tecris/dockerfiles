#!/bin/bash


docker kill $(docker ps -a | grep k8s | cut -c 1-12)
docker rm -v $(docker ps -a | grep k8s | cut -c 1-12)
