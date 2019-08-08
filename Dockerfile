FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients \
  && mkdir /var/forecast
VOLUME /etc/darksky /var/forecast/
COPY run.sh /usr/bin/
CMD /usr/bin/run.sh
