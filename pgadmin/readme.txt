docker exec -it postgres-demo bash
su - postgres
psql postgres
CREATE USER rango WITH password 'rango';
ALTER USER rango WITH SUPERUSER;
CREATE DATABASE rangob;
\q
