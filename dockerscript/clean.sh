#!/bin/sh
docker service rm $(docker service ls -q)
docker system prune

