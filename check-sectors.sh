#!/bin/bash

# Healthchecks.io ping URL (replace this with your own)
PING_URL="https://hc-ping.com/YOUR-UUID-HERE"

# Perform POST request and parse the JSON
RESPONSE=$(curl -s -X POST "https://tickets.clubbrugge.be/Stadium/GetWGLSectorsInfo?eventId=8175" -H "Content-Type: application/json" -H "Content-Length: 0" --compressed)

# Debug log to inspect raw response
# echo "Raw response:"
# echo "$RESPONSE"


# Extract number of sectors
SECTOR_COUNT=$(echo "$RESPONSE" | jq '.sectors | length')

echo "$(date) - Found $SECTOR_COUNT sectors"

# If sectors are available, ping Healthchecks
if (( SECTOR_COUNT > 0 )); then
  curl -fsS "$PING_URL" > /dev/null
fi