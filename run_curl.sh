#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

curl -X POST 'https://api.airfranceklm.com/opendata/offers/v1/best-fare-offers' \
-H 'accept: application/json' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/hal+json' \
-d '{
  "bestOffers": [
    {
      "bookingDateInterval": {
        "to": "2024-02-29"
      },
      "connections": [
        {
          "travelDateIntervals": [
            {
              "from": "2024-03-06"
            }
          ],
          "origin": {
            "code": "MIA",
            "type": "AIRPORT"
          },
          "destination": {
            "code": "CDG",
            "type": "AIRPORT"
          },
          "commercialCabin": "PREMIUM",
          "fareBasis": "ALX76SP1"
        },
        {
          "travelDateIntervals": [
            {
              "from": "2024-03-06"
            }
          ],
          "origin": {
            "code": "CDG",
            "type": "AIRPORT"
          },
          "destination": {
            "code": "MIA",
            "type": "AIRPORT"
          },
          "commercialCabin": "PREMIUM",
          "fareBasis": "ALX76SP1"
        }
      ],
      "price": {
        "displayPrice": 1196.9,
        "totalPrice": 1196.9,
        "pricePerPassengers": [
          {
            "id": 1,
            "passengerType": "ADT",
            "fare": 210.0,
            "taxes": 986.9
          }
        ],
        "currency": "USD",
        "displayType": "TAX"
      },
      "promoFare": true,
      "dataReference": "q0Y3wtElxNZQ29fT0crIwMjEwNjIwMHIwNTAytHNwMDS0srRytEnwtwsOMDQKr_AObGoCKjJ1tHNztnFXReIYZosHQyBOiGaDHBqAtqC1WfVyAFRDQ8vc6QQAXm0FiX8EOoMjZAUQkKgtrYWAA==",
      "expiryDateTime": "2024-02-28T15:19:08.848Z"
    }
  ]
}'


