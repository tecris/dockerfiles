#!/bin/bash

# http://fabric8.io/guide/openShiftDocker.html

docker kill openshift
docker rm -v openshift
docker kill $(docker ps -a | grep k8s | cut -c 1-12)
docker rm -v $(docker ps -a -q)
