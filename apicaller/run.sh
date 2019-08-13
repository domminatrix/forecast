#!/bin/sh

API="https://api.darksky.net/forecast"
LANG=fr
UNITS=si
USER_KEY=$(cat /etc/forecast/darksky_api_key)
LATITUDE=$(cat /etc/forecast/latitude)
LONGITUDE=$(cat /etc/forecast/longitude)
URL="${API}/${USER_KEY}/${LATITUDE},${LONGITUDE}?lang=$(LANG)&units=$(UNITS)&exclude=minutely,hourly,daily,flags"
echo $URL
API_RESPONSE=`curl -H "Accept: application/json" ${URL}`
echo $API_RESPONSE


#TODO : Etudier le -q

