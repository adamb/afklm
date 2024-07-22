# Air France KLM FF Ticket search

This project contains scripts to interact with the Air France KLM API.

The hope is that I can create a search that will look for frequent flyer tickets in 
a date range.  Eventually alerting me when those tickets drop below some point cost

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
