FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients curl jq \
  && mkdir /etc/forecast
VOLUME /etc/forecast/ 
COPY run.sh /usr/bin/
RUN chmod a+x /usr/bin/run.sh
CMD /usr/bin/run.sh
