#!/bin/bash

# Replace the following line with your actual curl command

curl --location 'https://api.airfranceklm.com/opendata/flightstatus?startRange=2024-12-31T09:00:00Z&endRange=2024-12-31T23:59:59Z' \
--header 'API-Key: [YOUR_API_KEY]' \
--header 'Content-Type: application/x-www-form-urlencoded'
