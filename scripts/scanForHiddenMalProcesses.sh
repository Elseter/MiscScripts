#!/bin/bash
echo "Scanning for hidden/malicious processes..."
ps aux | awk '$11 ~ /\(deleted\)/ {print "Possible malicious process:", $0}'
