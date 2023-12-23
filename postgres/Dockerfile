FROM postgres:16

# https://registry.hub.docker.com/_/postgres/ -> Initialization scripts
RUN mkdir -p /docker-entrypoint-initdb.d

#  scripts in /docker-entrypoint-initdb.d are only run if you start the container with a data directory that is empty
# https://registry.hub.docker.com/_/postgres -> Initialization scripts
COPY init.sh /docker-entrypoint-initdb.d/
