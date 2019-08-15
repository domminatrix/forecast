#!/bin/sh

source func_send_config.sh

#TODO : Etudier le -q
mosquitto_sub -h  srvMosquitto -t domminatrix/forecast/configure/isupdated -q 1 | while read RAW_DATA
do
set_config_in_var
cr=$(echo "$RAW_DATA" | jq -cSM .)
rd=$(echo "$CONF_REF" | jq -cSM .)
echo "cr"
echo "$cr"
echo rd
echo "$rd"
if [ "$cr" == "$rd" ]; then
    echo "Matched"
    mosquitto_pub -h srvMosquitto -q 1 -t domminatrix/forecast/configure/isupdated/resp -m 0
else
    echo "NOT Matched"
    mosquitto_pub -h srvMosquitto -q 1 -t domminatrix/forecast/configure/isupdated/resp -m 1
    send_conf_mqtt
fi;
#recup json config cache -> FROM_CONFIG_CACHE
# compare json $RAW_DATA == FROM_CONFIG_CACHE
# Si equal
# send mqtt isupdated/resp 1
# sinon mqtt isupdated/resp 0
# mqtt send conf
done
