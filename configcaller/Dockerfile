FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients 
CMD mosquitto_pub -h srvMosquitto -t domminatrix/forecast/configure -q 1 -m "Hello ceci est ma conf livrée pour vous"
#TODO : Etudier le -q

