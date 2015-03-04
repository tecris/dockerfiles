FROM ubuntu/postgres93

USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
	psql --command "CREATE USER oms WITH CREATEDB;" &&\
	createdb -U oms oms

USER root

RUN adduser --no-create-home --disabled-password --gecos "" oms
RUN adduser --no-create-home --disabled-password --gecos "" oms-mvn

RUN echo '[program:postgresql]' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'command=/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'user=postgres' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'autorestart=true' >> /etc/supervisor/conf.d/supervisord.conf
