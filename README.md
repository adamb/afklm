# Air France KLM FF Ticket search

This project contains scripts to interact with the Air France KLM API.

The hope is that I can create a search that will look for frequent flyer tickets in 
a date range.  Eventually alerting me when those tickets drop below some point cost

### Current Bugs


When I search for reward fares the first week of August, it's saying 50,000 miles. But these fares don't show up on the AF app.

Also, if I try to use the response link it says I'm over Qps but I wait for a few minutes and try that curl again and still get the error.  


 % curl -H "API-Key: XXX" -H 'Accept: application/json' "https://api.airfranceklm.com/opendata/offers/b/v1/lowest-fare-offers?d=q0YZgYWGM0p7txrYiTSEVkagQhyoG2PEMRpRKsZi1gxgizBa6LXYuhoQpfC2CYSLvbsIkcPevKyGdgyqIUOrzi7usOoUHqG1KENYUIVebt5YFCJac7GI2h_qNEhfNxYUpGBtkDwMH0apxtZDdXRTiq3F6LuCmh7QEVOwAgA=6e2b4587519&dateInterval=2024-08-01/2024-08-08{&type,commercialCabin,displayPriceContent}"
<h1>Developer Over Qps</h1><h1>Developer Over Qps</h1>%



## Files

- `run_curl.sh`: A script to fetch the best fare offers.
- `run_test.sh`: A script to fetch flight status data.

## Usage

### Setting the API Key

Before running the scripts, set the API key as an environment variable:

```bash
export API_KEY=your_api_key_here
```

### Running the Scripts

To run the `run_curl.sh` script:

```bash
./run_curl.sh
```

To run the `run_test.sh` script:

```bash
./run_test.sh
```

## API Reference

For more details on the API used in this project, refer to the [Air France KLM Best Fare Offers API](https://developer.airfranceklm.com/products/api/offers/api-reference#tag/best-fare-offers).

## License

This project is licensed under the MIT License.
