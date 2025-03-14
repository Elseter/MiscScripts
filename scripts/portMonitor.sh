#!/bin/bash
echo "Initial snapshot of open ports..."
ss -tulnp
ss -tulnp >initial_ports.txt

while true; do
  sleep 10
  ss -tulnp >current_ports.txt
  diff initial_ports.txt current_ports.txt
  mv current_ports.txt initial_ports.txt
done
