
 Wildfly configured for PostgreSQL data source.
 
 Datasource properties:
  - postgres.ipaddress - postgres database ip address
  - postgres.port      - postgres port
  - postgres.database  - database name
  - postgres.username  - database user
  - postgres.password  - database password

 Container has to be started with following command line:
  -Dpostgres.ipaddress=127.0.0.1 -Dpostgres.port=3306 -Dpostgres.database=db_name -Dpostgres.username=root -Dpostgres.password=postgres 

