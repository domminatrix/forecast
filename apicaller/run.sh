#!/bin/sh

API="https://api.darksky.net/forecast"
LANG=fr
UNITS=si
USER_KEY=$(cat /etc/forecast/darksky_api_key)
LATITUDE=$(cat /etc/forecast/latitude)
LONGITUDE=$(cat /etc/forecast/longitude)
URL="${API}/${USER_KEY}/${LATITUDE},${LONGITUDE}?lang=${LANG}&units=${UNITS}&exclude=minutely,hourly,daily,flags"
echo $URL
API_RESPONSE=`curl -H "Accept: application/json" ${URL}`
echo $API_RESPONSE


#TODO : Etudier le -q

PRECIP_INTEN=`echo $API_RESPONSE | jq .currently.precipIntensity`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/precip/intensity -q 1 -m "${PRECIP_INTEN}"
PRECIP_PROB=`echo $API_RESPONSE | jq .currently.precipProbability`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/precip/prob -q 1 -m "${PRECIP_PROB}"
TMP=`echo $API_RESPONSE | jq .currently.temperature`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/temperature/real -q 1 -m "${TMP}"
TMP_APP=`echo $API_RESPONSE | jq .currently.apparentTemperature`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/temperature/appear -q 1 -m "${TMP_APP}"
HUMID=`echo $API_RESPONSE | jq .currently.humidity`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/humidity -q 1 -m "${HUMID}"
PRESS=`echo $API_RESPONSE | jq .currently.pressure`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/pressure -q 1 -m "${PRESS}"
WIND_SPEED=`echo $API_RESPONSE | jq .currently.windSpeed`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/wind/speed -q 1 -m "${WIND_SPEED}"
WIND_RAF=`echo $API_RESPONSE | jq .currently.windGust`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/wind/gust -q 1 -m "${WIND_RAF}"
WIND_DIR=`echo $API_RESPONSE | jq .currently.windBearing`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/wind/bearing -q 1 -m "${WIND_DIR}"
CLOUD=`echo $API_RESPONSE | jq .currently.cloudCover`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/cloudcover -q 1 -m "${CLOUD}"
UV=`echo $API_RESPONSE | jq .currently.uvIndex`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/uv -q 1 -m "${UV}"
VISIB=`echo $API_RESPONSE | jq .currently.visibility`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/visibility -q 1 -m "${VISIB}"
OZONE=`echo $API_RESPONSE | jq .currently.ozone`
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/ozone -q 1 -m "${OZONE}"
