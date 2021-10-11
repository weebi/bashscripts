#!/bin/bash

main() {
    local data=$(curl -s "https://services.swpc.noaa.gov/products/alerts.json")

    [[ -n $data ]] && echo "$data" | jq -r '.[0] | "[\(.product_id)] (\(.issue_datetime)):\n\n\(.message)"' || echo "Error in contacting alert API, try again later." > /dev/stderr
}

main
