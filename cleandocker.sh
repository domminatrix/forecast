#!/bin/sh
docker stop $(docker ps -a -q)
docker system prune

