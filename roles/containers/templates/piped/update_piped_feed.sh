#!/bin/bash

subscriptions=$(docker exec -i piped_postgres psql -U piped -d piped -qtAX -c 'select id from public.pubsub;')

while IFS= read -r line; do
        curl -k "https://pipedapi.{{ domain_local }}/channel/$line" > /dev/null
        sleep 1;
done <<< $subscriptions
