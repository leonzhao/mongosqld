#!/bin/bash

MONGOSQL_ARGS=""

# Mongo uri to connect to. Default: mongodb://localhost:27017
if [ -n "$MONGO_URI" ]; then
  MONGOSQL_FLAGS="${MONGOSQL_ARGS} --mongo-uri ${MONGO_URI}"
else
  MONGOSQL_FLAGS="${MONGOSQL_ARGS} --mongo-uri mongodb://localhost:27017"
fi

# Auth params for connection to a mongo db
if [ -n "$MONGO_USERNAME" ] && [ -n "$MONGO_PASSWORD" ]  && [ -n "$MONGO_AUTH_DB" ]; then
        MONGOSQL_FLAGS="${MONGOSQL_FLAGS} --username ${MONGO_USERNAME} --password ${MONGO_PASSWORD} --authenticationDatabase ${MONGO_AUTH_DB} "
fi

#mongosqld "$MONGOSQL_FLAGS" "$@"
#mongosqld "$MONGOSQL_FLAGS"
# exec "mongosqld $MONGOSQL_FLAGS" "$@"
# exec mongosqld "$MONGOSQL_FLAGS"
exec mongosqld --config config.yaml
