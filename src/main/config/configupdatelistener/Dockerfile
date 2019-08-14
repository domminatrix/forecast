FROM alpine:3.10
RUN apk add --no-cache mosquitto-clients jq
COPY func_send_config.sh configupdatelistener/run.sh /usr/bin/
RUN chmod a+x /usr/bin/run.sh
CMD /usr/bin/run.sh
