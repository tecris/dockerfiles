#!/bin/sh

docker run -d -p 23:22 -p 5432:5432 ubuntu/postgres93
