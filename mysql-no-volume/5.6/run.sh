#!/bin/bash

docker-compose up -d

sleep 5

docker exec -it mysql-test57 mysql -uroot -se 'select * from db.pet'
