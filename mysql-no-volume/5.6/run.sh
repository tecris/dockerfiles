#!/bin/bash

docker-compose up -d

sleep 5

docker exec -it mysql-test56 mysql -uroot -se 'select * from db.pet'
