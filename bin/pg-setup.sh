#!/bin/bash

export POSTGRES_CONN_URI="postgres://user:password@localhost/app_dev"

docker exec -it app-postgresql psql $POSTGRES_CONN_URI -tc "ALTER SYSTEM SET wal_level = 'logical';" && \
  docker-compose restart postgres
