FROM casadocker/postgres93

USER postgres

ADD ./oms-12072015-truncated.pg /var/lib/postgresql/oms.pg

RUN     /etc/init.d/postgresql start &&\
        psql --command "CREATE USER oms WITH CREATEDB;" &&\
        # pgsql is needed for pg_restore
        psql --command "CREATE USER pgsql WITH CREATEDB;" &&\
        createdb -U oms oms  &&\
        createdb -U oms oms-mvn  &&\
        # in case an empty empty database is needed
        cat /var/lib/postgresql/sql/*.sql | psql -U oms oms-mvn &&\
        # restore dump
        pg_restore -v -d oms /var/lib/postgresql/oms.pg &&\
        # reset admin password to 'admin'
        psql oms --command "UPDATE users SET password='a40546cc4fd6a12572828bb803380888ad1bfdab' WHERE id=1;"

USER root

RUN chown postgres:postgres /var/lib/postgresql/oms.pg
RUN adduser --no-create-home --disabled-password --gecos "" oms
# testing user (not used currently)
RUN adduser --no-create-home --disabled-password --gecos "" oms-mvn

USER postgres

ENTRYPOINT ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
