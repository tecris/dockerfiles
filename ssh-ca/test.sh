#!/bin/bash

docker cp honeypot:/home/jenkins/.ssh/jenkins .
docker cp honeypot:/home/jenkins/.ssh/jenkins.pub .
docker cp honeypot:/home/jenkins/.ssh/jenkins-cert.pub .
ssh -vvvv -i jenkins jenkins@127.0.0.1 -p 2233
