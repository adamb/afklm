#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

response=$(curl -s -o response.json -w "%{http_code}" -X POST 'https://api.airfranceklm.com/opendata/offers/v1/best-fare-offers' \
-H 'Accept: application/json' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/json' \
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
  cat response.json
else
  cat response.json
fi

# Clean up
rm response.json


