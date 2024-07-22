#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

curl -X POST 'https://api.airfranceklm.com/opendata/offers/v1/best-fare-offers' \
-H 'accept: application/json' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/json' \
-d '{
  "commercialCabin": "PREMIUM",
  "bookingFlow": "LEISURE",
  "promoType": "LOWEST_FARE",
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
  "dateInterval": "2024-02-28/2024-09-28",
  "filters": {
    "marketingCarriers": [
      "AF"
    ]
  }
}'


