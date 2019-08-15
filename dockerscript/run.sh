#!/bin/sh

docker network create --driver bridge mqttnetwork -o "com.docker.networkbridge.name=mqttnetwork"
docker volume create mosquitto_data
docker volume create mosquitto_log
docker run --name=srvMosquitto \
	-p 1883:1883 \
	-p 9001:9001 \
	-v mosquitto_data:/mosquitto/data \
	-v mosquitto_log:/mosquitto/log \
	--restart="always" \
	--detach=true \
	eclipse-mosquitto
docker network connect mqttnetwork srvMosquitto

docker volume create forecastconfig
docker run --name forecastconfiglistener \
	-v forecastconfig:/etc/forecast/ \
	--network mqttnetwork \
	--restart="always" \
	--detach=true \
	domminatrix/forecastconfiglistener:latest 

docker run --name forecastconfigcalltester \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigcalltester:latest 

docker run --name forecastconfigupdatelistener \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigupdatelistener:latest 

docker run --name forecastconfigcallisupdatedtester \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigcallisupdatedtester:latest

docker run --name forecastapicalltester \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastapicalltester:latest 
sleep 4

docker run --name forecastconfigcaller \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigcaller:latest 
	
docker run --name forecastconfigupdatecallernotupdated \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigupdatecallernotupdated:latest

docker run --name forecastconfigupdatecallerupdated \
	--network mqttnetwork \
	--rm \
	--detach=true \
	domminatrix/forecastconfigupdatecallerupdated:latest

docker run --name forecastapicaller \
	-v forecastconfig:/etc/forecast/ \
	--detach=true \
	-it \
	domminatrix/forecastapicaller:latest 
docker network connect mqttnetwork forecastapicaller

docker ps
