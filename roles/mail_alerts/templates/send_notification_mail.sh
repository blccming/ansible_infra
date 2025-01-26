#!/bin/bash
subject=$1
contents=$2

curl -X POST 'https://api.resend.com/emails' \
  -H 'Authorization: {{ mail_notfication_api_key }}' \
  -H 'Content-Type: application/json' \
  -d '{
    "from": "🚨 BLCCMING NOTIFICATION <alert@notifier.blccm.ing>",
    "to": "{{ mail_notification_rcv_address }}",
    "subject": "$subject",
    "html": "<p>$contents</p>"
  }'
