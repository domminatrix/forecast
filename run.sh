#!/bin/sh

while read msg;
do
   echo $msg;
done < <(mosquitto_sub -h mqtt -t domminatrix/forecast/configure -q 1)
#TODO : Etudier le -q
