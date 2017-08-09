FROM mysql:5.7

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes
ENV MYSQL_DATABASE db
# fix for the error “Mysql Server has gone away”
RUN echo max_allowed_packet = 128M >> /etc/mysql/mysql.conf.d/mysqld.cnf
# modify datadir to point outside the VOLUME defined in mysql:5.7 image
# this is required to keep data inside the image
RUN sed -i -e 's/\/var\/lib\/mysql/\/var\/lib\/mysql2/g' /etc/mysql/mysql.conf.d/mysqld.cnf
COPY db.sql /docker-entrypoint-initdb.d/db.sql
RUN /entrypoint.sh mysqld & sleep 20 && killall mysqld
RUN rm /docker-entrypoint-initdb.d/db.sql
