#!/bin/bash
SUBJECT=$1
CONTENTS=$2

curl -X POST 'https://api.resend.com/emails' \
  -H 'Authorization: {{ mail_notification_api_key }}' \
  -H 'Content-Type: application/json' \
  -d "{
    \"from\": \"🚨 BLCCMING NOTIFICATION <alert@notifier.{{ domain_public }}>\",
    \"to\": \"{{ mail_notification_rcv_address }}\",
    \"subject\": \"$SUBJECT\",
    \"html\": \"<p>$CONTENTS</p>\"
  }" > /dev/null 2>&1
