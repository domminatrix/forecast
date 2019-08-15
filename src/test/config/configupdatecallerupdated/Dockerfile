FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients 
#Change by your correct darksky api key and correct lat long coordonnate
CMD mosquitto_pub -h srvMosquitto -t domminatrix/forecast/configure/isupdated -q 1 -m \
"[{\"top\":\"domminatrix/forecast/precip/intensity\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/precip/prob\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/temperature/real\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/temperature/appear\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/humidity\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/pressure\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/wind/speed\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/wind/gust\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/wind/bearing\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/cloudcover\",\"dir\":0,\"freq\":\"*/10 * * * *\"},{\"top\":\"domminatrix/forecast/uv\",\"dir\":0,\"freq\":\"*/10 * * * *\"}]"
#TODO : Etudier le -q

