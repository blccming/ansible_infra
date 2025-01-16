#!/bin/bash

subscriptions=$(docker exec -i postgres psql -U piped -d piped -qtAX -c 'select id from public.pubsub;')

while IFS= read -r line; do
        curl -k "https://pipedapi.lab.zykla.me/channel/$line" > /dev/null
        sleep 1;
done <<< $subscriptions
