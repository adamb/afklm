#!/bin/bash

# Enable debug mode
# set -x

# Replace the following line with your actual curl command

response=$(curl -s -D headers.txt -o response.json -w "%{http_code}" -X POST 'https://api.airfranceklm.com/opendata/offers/v3/lowest-fare-offers' \
-H 'Accept: application/hal+json' \
-H "API-Key: ${API_KEY}" \
-H 'Content-Type: application/json' \
-H 'AFKL-TRAVEL-Host: AF' \
-d '{
  "bookingFlow": "REWARD",
  "commercialCabins": [
    "BUSINESS"
  ],
  "passengers": [
    {
      "id": 1,
      "type": "ADT"
    }
  ],
  "requestedConnections": [
    {
      "departureDate": "2024-08-02",
      "dateInterval": "2024-08-02/2024-08-08",
      "origin": {
        "type": "CITY",
        "code": "PAR"
      },
      "destination": {
        "type": "CITY",
        "code": "NYC"
      }
    }
  ],
  "type": "DAY",
  "withUpsellCabins": true,
  "displayPriceContent": "ALL_PAX"
}')

if [ "$response" -ne 200 ]; then
  echo "Error: Received HTTP status code $response"
  echo "Response Headers:"
  cat headers.txt
  echo "Response Body:"
  cat response.json | jq
else
  echo "Full JSON Response:"
  cat response.json | jq

  lowest_fare_link=$(jq -r '.recommendations[0].flightProducts[0].connections[0]._links.availableOffers.href' response.json)
  
  echo "Extracted lowestFareOffers link: ${lowest_fare_link}"

  if [ -z "$lowest_fare_link" ]; then
    echo "Error: lowestFareOffers link is null"
  else
    echo "To fetch the lowest fare offers URL, use the following curl command:"
    echo "curl -H \"API-Key: ${API_KEY}\" -H 'Accept: application/json' \"${lowest_fare_link}\""
  fi
fi

# Clean up
rm headers.txt
rm response.json


