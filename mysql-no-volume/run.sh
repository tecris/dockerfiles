#!/bin/bash

docker-compose up -d

sleep 5

docker exec -it mysqlnovolume_db_1 mysql -uroot -se 'select * from db.pet'
