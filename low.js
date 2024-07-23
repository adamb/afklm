const fetch = require('node-fetch');
const API_KEY = process.env.API_KEY;

async function fetchLowestFareOffers() {
    const response = await fetch('https://api.airfranceklm.com/opendata/offers/v3/lowest-fare-offers', {
        method: 'POST',
        headers: {
            'Accept': 'application/hal+json',
            'API-Key': API_KEY,
            'Content-Type': 'application/json',
            'AFKL-TRAVEL-Host': 'AF'
        },
        body: JSON.stringify({
            "bookingFlow": "REWARD",
            "commercialCabins": ["BUSINESS"],
            "passengers": [{"id": 1, "type": "ADT"}],
            "requestedConnections": [{
                "departureDate": "2024-08-02",
                "dateInterval": "2024-08-02/2024-08-08",
                "origin": {"type": "CITY", "code": "PAR"},
                "destination": {"type": "CITY", "code": "NYC"}
            }],
            "type": "DAY",
            "withUpsellCabins": true,
            "displayPriceContent": "ALL_PAX"
        })
    });

    const status = response.status;
    const headers = response.headers.raw();
    const jsonResponse = await response.json();

    if (status !== 200) {
        console.error(`Error: Received HTTP status code ${status}`);
        console.error('Response Headers:', headers);
        console.error('Response Body:', jsonResponse);
    } else {
        console.log('Full JSON Response:', jsonResponse);

        const lowestFareLink = jsonResponse.recommendations?.[0]?.flightProducts?.[0]?.connections?.[0]?._links?.availableOffers?.href;
        console.log(`Extracted lowestFareOffers link: ${lowestFareLink}`);

        if (!lowestFareLink) {
            console.error('Error: lowestFareOffers link is null');
        } else {
            console.log('To fetch the lowest fare offers URL, use the following curl command:');
            console.log(`curl -H "API-Key: ${API_KEY}" -H 'Accept: application/json' "${lowestFareLink}"`);
        }
    }
}

fetchLowestFareOffers().catch(console.error);
