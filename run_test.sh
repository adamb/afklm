#!/bin/bash

# Fetch the API key from the environment variable
API_KEY=${API_KEY}

response=$(curl -s -D headers.txt -o response.json -w "%{http_code}" --location 'https://api.airfranceklm.com/opendata/flightstatus?startRange=2024-12-31T09:00:00Z&endRange=2024-12-31T15:00:00Z' \
     --header "API-Key: ${API_KEY}" \
     --header 'Content-Type: application/x-www-form-urlencoded')

{
  if [ "$response" -ne 200 ]; then
    echo "Error: Received HTTP status code $response"
    echo "Response Headers:"
    cat headers.txt
    echo "Response Body:"
    cat response.json
  else
    echo "Response Headers:"
    cat headers.txt
    echo "Response Body:"
    cat response.json
  fi

  # Clean up
  rm headers.txt
  rm response.json
} > test.out
