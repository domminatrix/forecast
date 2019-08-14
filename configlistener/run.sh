#!/bin/sh

source func_send_config.sh

#TODO : Etudier le -q
mosquitto_sub -h  srvMosquitto -t domminatrix/forecast/configure -q 1 | while read RAW_DATA
do
   mkdir -p /etc/forecast/
   rm -f /etc/forecast/darksky_api_key;
   touch /etc/forecast/darksky_api_key;
   echo $RAW_DATA | cut -d '_' -f1 | tee /etc/forecast/darksky_api_key;
   rm -f /etc/forecast/latitude;
   touch /etc/forecast/latitude;
   echo $RAW_DATA | cut -d '_' -f2 | tee /etc/forecast/latitude;
   rm -f /etc/forecast/longitude;
   touch /etc/forecast/longitude;
   echo $RAW_DATA | cut -d '_' -f3 | tee /etc/forecast/longitude;
   send_conf_mqtt
done
