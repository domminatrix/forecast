FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients 
CMD mosquitto_sub -h srvMosquitto -q 1 \
	-t domminatrix/forecast/ozone \
	-t domminatrix/forecast/visibility \
	-t domminatrix/forecast/uv \
	-t domminatrix/forecast/cloudcover \
	-t domminatrix/forecast/wind/bearing \
	-t domminatrix/forecast/wind/gust \
	-t domminatrix/forecast/wind/speed \
	-t domminatrix/forecast/pressure \
	-t domminatrix/forecast/humidity \
	-t domminatrix/forecast/temperature/appear \
	-t domminatrix/forecast/temperature/real \
	-t domminatrix/forecast/precip/prob \
	-t domminatrix/forecast/precip/intensity
#TODO : Etudier le -q

