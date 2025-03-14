#!/bin/bash
echo "Monitoring SSH login attempts... Press Ctrl+C to stop."
while true; do
  grep "Failed password" /var/log/auth.log | tail -n 10
  sleep 5
done
