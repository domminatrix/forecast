#!/bin/sh


docker service create --name swarm_cronjob \
  --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
  --env "LOG_LEVEL=info" \
  --env "LOG_JSON=false" \
  --constraint "node.role == manager" \
  crazymax/swarm-cronjob

docker network create --driver=overlay --attachable mqttnetwork
docker volume create mosquitto_data
docker volume create mosquitto_log
docker service create  --name=srvMosquitto \
	-p 1883:1883 \
	-p 9001:9001 \
	--mount type=volume,source=mosquitto_data,destination=/mosquitto/data,volume-label="color=red",volume-label="shape=round" \
	--mount type=volume,source=mosquitto_log,destination=/mosquitto/log,volume-label="color=red",volume-label="shape=round" \
	--detach=true \
	--network=mqttnetwork \
	eclipse-mosquitto

docker volume create forecastconfig
docker service create --name forecastconfiglistener \
	--mount type=volume,source=forecastconfig,destination=/etc/forecast,volume-label="color=red",volume-label="shape=round" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfiglistener:latest 

docker service create --name forecastconfigcalltester \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigcalltester:latest 

docker service create --name forecastconfigupdatelistener \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigupdatelistener:latest 

docker service create --name forecastconfigcallisupdatedtester \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \*/2 \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigcallisupdatedtester:latest

docker service create --name forecastapicalltester \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \*/10 \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastapicalltester:latest 
sleep 4

docker service create --name forecastconfigcaller \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \*/4 \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigcaller:latest 
	
docker service create --name forecastconfigupdatecallernotupdated \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \* \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigupdatecallernotupdated:latest

docker service create --name forecastconfigupdatecallerupdated \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \* \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	domminatrix/forecastconfigupdatecallerupdated:latest

docker service create --name forecastapicaller \
	--mount type=volume,source=forecastconfig,destination=/etc/forecast,volume-label="color=red",volume-label="shape=round" \
	--label "swarm.cronjob.enable=true" \
	--label "swarm.cronjob.skip-running=false" \
	--label "swarm.cronjob.schedule=0 \*/10 \* \* \* \*" \
	--network mqttnetwork \
	--detach=true \
	-t \
	domminatrix/forecastapicaller:latest 

docker ps
