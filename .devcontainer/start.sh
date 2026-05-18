#!/bin/bash

echo "[g2ray auto-restart] Started..."

while true; do
  sudo /usr/local/bin/xray run -c /etc/xray/g2ray.json &>/tmp/xray.log &
  PID=$!

  sleep 2
  show-link.sh

  echo "[g2ray] Running with PID $PID"

  # Keepalive every 3 minutes for 3 hours
  for ((i=0; i<60; i++)); do
    sleep 180
    echo "1"
  done

  echo "[g2ray] Stopping..."
  kill $PID

  sleep 5

  echo "[g2ray] Restarting..."
done
