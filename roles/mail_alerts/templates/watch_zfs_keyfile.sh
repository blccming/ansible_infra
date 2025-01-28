#!/bin/bash

KEYFILE="/etc/zfs_keys/keyfile"
MAIL_SCRIPT="/home/{{ username }}/bin/send_notificatin_mail.sh"
CURRENT_TIME=$(date +"%Y-%m-%dT%H:%M:%S %Z")

inotifywait -m "$KEYFILE" |
while read path action file; do
    bash "$MAIL_SCRIPT" "⚠️ ZFS keyfile accessed" "The zfs keyfile was accessed at <strong>$CURRENT_TIME </strong>."
done
