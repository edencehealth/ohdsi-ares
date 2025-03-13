export default { getEnvJSON };

// NOTE: if you want to refer to a runtime environment variable via process.env,
// make sure you include it in the list in load_njs.sh

function getEnvJSON(r) {
    // this function is meant to dynamically produce a document like the following file:
    // from: https://raw.githubusercontent.com/OHDSI/Ares/refs/heads/main/public/env/env.json
    // as of: 13-Mar-2025
    // {
    //     "WEB_API_URL": "./",
    //     "WEB_API_ENABLED": false,
    //     "DUCKDB_ENABLED": false,
    //     "CDM_NETWORK_NAME": ""
    // }

    r.headersOut['Content-Type'] = 'application/json';
    r.return(200, JSON.stringify({
        "WEB_API_URL": process.env.WEB_API_URL || "./",
        "WEB_API_ENABLED": process.env.WEB_API_ENABLED || false,
        "DUCKDB_ENABLED": process.env.DUCKDB_ENABLED || false,
        "CDM_NETWORK_NAME": process.env.CDM_NETWORK_NAME || "",
    }));
}
