FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients \
  && mkdir -p /etc/forecast/
VOLUME /etc/forecast/
COPY func_send_config.sh configlistener/run.sh /usr/bin/
RUN chmod a+x /usr/bin/run.sh
CMD /usr/bin/run.sh
