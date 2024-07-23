#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

response=$(curl -s -D headers.txt -o response.json -w "%{http_code}" -X POST 'https://api.airfranceklm.com/opendata/offers/v1/best-fare-offers' \
-H 'Accept: application/json, text/plain, */*' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/json' \
-H 'AFKL-TRAVEL-Host: your_host_here' \
-d '{
  "commercialCabin": "BUSINESS",
  "bookingFlow": "REWARD",
  "passengers": [
    {
      "id": 1,
      "type": "ADT"
    }
  ],
  "requestedConnections": [
    {
      "origin": {
        "code": "CDG",
        "type": "AIRPORT"
      },
      "destination": {
        "code": "JFK",
        "type": "AIRPORT"
      }
    }
  ],
  "dateInterval": "2024-08-01/2024-08-08",
  "filters": {
    "marketingCarriers": [
      "AF"
    ]
  }
}')

if [ "$response" -ne 200 ]; then
  echo "Error: Received HTTP status code $response"
  echo "Response Headers:"
  cat headers.txt
  echo "Response Body:"
  cat response.json
else
  cat response.json
fi

# Clean up
rm headers.txt
rm response.json


