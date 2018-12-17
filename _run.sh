#!/bin/bash -xe

HOST_PORT=3000
CONTAINER_PORT=80

docker run -d \
           -p $HOST_PORT:$CONTAINER_PORT \
           -v $PWD/wiki-data:/opt/dokuwiki \
           -e HTTP_PORT="$CONTAINER_PORT" \
           --rm dokuwiki

