#!/bin/bash
previous_cron=$(crontab -l 2>/dev/null)

while true; do
  sleep 60
  current_cron=$(crontab -l 2>/dev/null)

  if [[ "$previous_cron" != "$current_cron" ]]; then
    echo "[ALERT] Crontab modified!"
    echo "Old crontab:"
    echo "$previous_cron"
    echo "New crontab:"
    echo "$current_cron"
    previous_cron="$current_cron"
  fi
done
