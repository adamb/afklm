#!/bin/bash

# Fetch the API key from the environment variable
API_KEY=${API_KEY}

curl --location 'https://api.airfranceklm.com/opendata/flightstatus?startRange=2024-12-31T09:00:00Z&endRange=2024-12-31T23:59:59Z' \
--header "API-Key: ${API_KEY}" \
--header 'Content-Type: application/x-www-form-urlencoded'
