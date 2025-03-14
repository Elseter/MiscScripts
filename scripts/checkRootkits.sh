#!/bin/bash
echo "Checking for rootkits..."
if command -v chkrootkit &>/dev/null; then
  sudo chkrootkit
elif command -v rkhunter &>/dev/null; then
  sudo rkhunter --check
else
  echo "Please install chkrootkit or rkhunter for rootkit detection."
fi
