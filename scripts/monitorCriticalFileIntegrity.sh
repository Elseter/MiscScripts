#!/bin/bash
watch_files=("/etc/passwd" "/etc/shadow" "/etc/sudoers")
declare -A hashes

# Initialize hashes
for file in "${watch_files[@]}"; do
  hashes[$file]=$(md5sum "$file" | awk '{print $1}')
done

echo "Monitoring critical files for changes..."
while true; do
  sleep 5
  for file in "${watch_files[@]}"; do
    new_hash=$(md5sum "$file" | awk '{print $1}')
    if [[ "${hashes[$file]}" != "$new_hash" ]]; then
      echo "[ALERT] Change detected in $file!"
      hashes[$file]="$new_hash"
    fi
  done
done
