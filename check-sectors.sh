#!/bin/bash

# Healthchecks.io ping URL (replace this with your own)
PING_URL="https://hc-ping.com/YOUR-UUID-HERE"

# Perform POST request and parse the JSON
RESPONSE=$(curl -s -X POST "https://tickets.clubbrugge.be/Stadium/GetWGLSectorsInfo?eventId=8175" -H "Content-Type: application/json" -H "Content-Length: 0" --compressed)

echo "Raw response: $RESPONSE"

COUNT=$(echo "$RESPONSE" | jq '.sectors | length')

if (( COUNT > 0 )); then
  echo "Sectors found! Sending ping..."
  curl -fsS "https://hc-ping.com/${HC_PING}" > /dev/null
else
  echo "No sectors found."
  
fi