#!/bin/sh

#TODO : Etudier le -q
mosquitto_sub -h  srvMosquitto -t domminatrix/forecast/configure -q 1 | while read RAW_DATA
do
   mkdir -p /etc/forecast/
   rm -f /etc/forecast/darksky_api_key;
   touch /etc/forecast/darksky_api_key;
   echo $RAW_DATA | tee /etc/forecast/darksky_api_key;
done