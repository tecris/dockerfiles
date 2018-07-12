#!/bin/bash

HOST=localhost

# create database in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE DATABASE \"dcts-monitoring\""

# create retention policy in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE RETENTION POLICY \"dcts-monitoring-retention\" ON \"dcts-monitoring\" DURATION 7d REPLICATION 1 DEFAULT"
