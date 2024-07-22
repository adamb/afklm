#!/bin/bash

# Replace the following line with your actual curl command

curl -X POST 'https://api.airfranceklm.com/travel/offers/v1/best-fare-offers' \
-H 'accept: application/json' \
-H 'api-key: YOUR_API_KEY' \
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
  "dateInterval": "2004-08-01/2004-08-08",
  "filters": {
    "marketingCarriers": [
      "AF"
    ]
  }
}'
