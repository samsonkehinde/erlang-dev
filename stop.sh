#!/bin/sh -e
NAME=${NAME:-"erlang-dev"}
echo Stopping Container: $NAME

docker stop -t 1 $(docker ps | grep "$NAME" | cut -d' ' -f1)
