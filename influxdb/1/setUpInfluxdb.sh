#!/bin/bash

HOST=localhost

# create dcts-monitoring database in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE DATABASE \"dcts-monitoring\""

# create dcts-monitoring retention policy in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE RETENTION POLICY \"dcts-monitoring-retention\" ON \"dcts-monitoring\" DURATION 7d REPLICATION 1 DEFAULT"

# create telegraf database in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE DATABASE \"telegraf\""

# create telegraf retention policy in influxdb
curl -XPOST http://${HOST}:8086/query --data-urlencode "q=CREATE RETENTION POLICY \"telegraf-retention\" ON \"telegraf\" DURATION 7d REPLICATION 1 DEFAULT"
