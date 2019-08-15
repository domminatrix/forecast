FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients 
CMD mosquitto_sub -h srvMosquitto -q 1 \
	-t domminatrix/forecast/configure/isupdated/resp
#TODO : Etudier le -q

