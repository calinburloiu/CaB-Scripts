#!/usr/bin/env bash
#
# Sends a Wake-up on LAN to the NAS. Mac only.
#
# Set environment variables for your NAS: NAS_WIFI_SSID, NAS_MAC, NAS_LOCAL_HOST, NAS_PUBLIC_HOST, NAS_HTTP_PORT.
#

if [[ -z "$NAS_WIFI_SSID" || -z "$NAS_MAC" || -z "$NAS_LOCAL_HOST" || -z "$NAS_PUBLIC_HOST" || -z "$NAS_HTTP_PORT" ]]; then
  echo "Set environment variables for your NAS: WIFI_SSID, NAS_MAC, NAS_LOCAL_HOST, NAS_PUBLIC_HOST, NAS_HTTP_PORT." 1>&2;
  exit 1
fi

HTTP_MAX_WAIT=180

# TODO Use this variable to find the NAS host to use
# TODO Check what happens when Wi-Fi is off
# TODO Check how to send Wake Up on LAN from the Internet
wifi_ssid="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' | sed 's/^ *//g')"

echo "Sending Wake up on LAN..."
wakeonlan "$NAS_MAC"
echo "Waiting for NAS $NAS_LOCAL_HOST:$NAS_HTTP_PORT to open..."
status=$?
while [ $status -ne 0 ]; do
  sleep 1
  nc -z "$NAS_LOCAL_HOST" $NAS_HTTP_PORT
  status=$?
done 

echo -n "Waiting for HTTP server to start..."
for i in $(seq 1 $HTTP_MAX_WAIT); do
  http_status=$(curl --write-out '%{http_code}' --silent --output /dev/null --insecure "https://${NAS_LOCAL_HOST}:${NAS_HTTP_PORT}")
  if [[ $http_status -eq 200 ]]; then
    break
  fi

  sleep 1
  echo -n "."
done
echo ""

echo "Opening smb in Finder..."
open "afp://$NAS_LOCAL_HOST/"
echo "Enjoy!"

