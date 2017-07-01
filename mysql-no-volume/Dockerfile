FROM mysql:5.7

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_DATABASE db
RUN sed -i -e 's/\/var\/lib\/mysql/\/var\/lib\/mysql2/g' /etc/mysql/mysql.conf.d/mysqld.cnf
COPY db.sql /docker-entrypoint-initdb.d/db.sql
RUN /entrypoint.sh mysqld & sleep 20 && killall mysqld
RUN rm /docker-entrypoint-initdb.d/db.sql
