#!/bin/bash

echo "Run at: $(date -u)" >> run-log.txt

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