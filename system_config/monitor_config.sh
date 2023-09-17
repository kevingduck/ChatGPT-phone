#!/bin/bash

CONFIG_FILE_PATH="/home/admin/Desktop/ColdCallGenius-main/message_config.py"
SERVICE_NAME="coldcallgenius"

# Start the inotifywait process in the background
inotifywait -m -e close_write $CONFIG_FILE_PATH |
while read -r directory events filename; do
  echo "Config file '$filename' changed, restarting $SERVICE_NAME service..."
  systemctl restart $SERVICE_NAME.service
done