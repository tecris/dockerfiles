#!/bin/bash

docker run \
    --detach \
    --name matei.postgres \
    -e POSTGRES_PASSWORD=pass \
    -e POSTGRES_DB=football_fix \
    org.matei/postgres:16
