#!/bin/bash

docker run --name honeypot -d --rm -p 2233:22 ssh-honey
