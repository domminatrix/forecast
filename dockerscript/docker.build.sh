#!/bin/sh
docker build --no-cache -f src/main/config/configlistener/Dockerfile -t domminatrix/forecastconfiglistener:latest src/main/config
docker build --no-cache -f src/main/config/configupdatelistener/Dockerfile -t domminatrix/forecastconfigupdatelistener:latest src/main/config
docker build --no-cache -t domminatrix/forecastconfigcaller:latest src/test/config/configcaller
docker build --no-cache -t domminatrix/forecastconfigcalltester:latest src/test/config/configcalltester
docker build --no-cache -t domminatrix/forecastapicalltester:latest src/test/api/apicalltester
docker build --no-cache -t domminatrix/forecastapicaller:latest src/main/api/apicaller

