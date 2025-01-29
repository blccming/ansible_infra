#!/bin/bash

SOURCE_POOL="naspool/naspool_data"
TARGET_POOL="backuppool/backuppool_data"
MAIL_SCRIPT="/home/{{ username }}/bin/send_notification_mail.sh"

syncoid "$SOURCE_POOL" "$TARGET_POOL"

CURRENT_TIME=$(date +"%Y-%m-%dT%H:%M:%S %Z"
bash "$MAIL_SCRIPT" "💾 {{ hostname }}: Backup performed" "Syncoid completed a backup at <strong>$CURRENT_TIME</strong>."
