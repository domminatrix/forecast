send_conf_mqtt() {
local DATA="[ \
  { \
    \"top\":\"domminatrix\/forecast\/precip\/intensity\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/precip\/prob\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/temperature\/real\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  
  { \
    \"top\":\"domminatrix\/forecast\/temperature\/appear\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  
  { \
    \"top\":\"domminatrix\/forecast\/humidity\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  
  { \
    \"top\":\"domminatrix\/forecast\/pressure\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/wind\/speed\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/wind\/gust\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/wind\/bearing\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/cloudcover\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/uv\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/visibility\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  }, \
  { \
    \"top\":\"domminatrix\/forecast\/ozone\", \
    \"dir\":0, \
    \"freq\":\"*/10 * * * *\" \
  } \
]"
echo $DATA  
mosquitto_pub -h srvMosquitto -t domminatrix/forecast/configure/resp -q 1 -m "${DATA}"
#TODO : Etudier le -q

}
