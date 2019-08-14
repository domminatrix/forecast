FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients 
#Change by your correct darksky api key and correct lat long coordonnate
CMD mosquitto_pub -h srvMosquitto -t domminatrix/forecast/configure -q 1 -m "KEY-DARKSKY-API_43.29695_5.38107"
#TODO : Etudier le -q

