#!/bin/bash
#
# 1. https://registry.hub.docker.com/_/postgres/ -> Initialization scripts

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE venue (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        address VARCHAR(255),
        description TEXT
    );
EOSQL
