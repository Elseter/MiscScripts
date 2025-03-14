#!/bin/bash
echo "Monitoring for suspicious processes... Press Ctrl+C to stop."
while true; do
  ps aux | grep -E "nc|ncat|bash -i|perl|python -c|sh -i" | grep -v grep
  sleep 3
done
