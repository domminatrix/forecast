#!/bin/sh

while read msg;
do
   rm /etc/forecast/darksky_api_key;
   touch /etc/forecast/darksky_api_key;
   echo $msg | tee /etc/forecast/darksky_api_key;
done < <(mosquitto_sub -h  srvMosquitto -t domminatrix/forecast/configure -q 1)
#TODO : Etudier le -q
