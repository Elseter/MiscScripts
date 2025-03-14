#!/bin/bash

# Define color codes
bold_blue="\033[1;34m"
reset="\033[0m"
bold_red="\033[1;31m"
bold_green="\033[1;32m"

echo -e "${bold_blue}Starting socket monitoring... Press Ctrl+C to stop.${reset}"

# Function to get all socket connections
get_all_sockets() {
  lsof -i -P -n | awk 'NR==1 {print "\033[1;36m" $0 "\033[0m"} NR>1 {print $0}'
}

# Store the initial state of sockets
previous_sockets=$(get_all_sockets)
echo "$previous_sockets"

# Loop to monitor sockets
while true; do
  sleep 1 # Update every second
  current_sockets=$(get_all_sockets)

  # Compare previous and current sockets
  diff_output=$(diff <(echo "$previous_sockets") <(echo "$current_sockets"))

  if [[ -n "$diff_output" ]]; then
    echo -e "${bold_red}WARNING: Socket changes detected!${reset}"
    echo "$diff_output"
  fi

  previous_sockets="$current_sockets"
done
