#!/bin/bash
previous_users=$(cut -d: -f1 /etc/passwd)

while true; do
  sleep 5
  current_users=$(cut -d: -f1 /etc/passwd)

  diff_output=$(diff <(echo "$previous_users") <(echo "$current_users"))
  if [[ -n "$diff_output" ]]; then
    echo "[ALERT] New user detected!"
    echo "$diff_output"
    previous_users="$current_users"
  fi
done
