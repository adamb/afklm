#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

curl -X POST 'https://api.airfranceklm.com/opendata/offers/v1/best-fare-offers' \
-H 'accept: application/json' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/hal+json' \
-d '{
  "commercialCabin": "PREMIUM",
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
        "code": "MIA",
        "type": "AIRPORT"
      },
      "destination": {
        "code": "CDG",
        "type": "AIRPORT"
      }
    },
    {
      "origin": {
        "code": "CDG",
        "type": "AIRPORT"
      },
      "destination": {
        "code": "MIA",
        "type": "AIRPORT"
      }
    }
  ],
  "dateInterval": "2024-08-01/2024-12-08",
  "filters": {
    "marketingCarriers": [
      "AF"
    ]
  }
}'


