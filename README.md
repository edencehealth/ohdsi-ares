# ohdsi-ares

Dockerization of the [OHDSI/Ares](https://github.com/OHDSI/Ares) application designed to monitor data quality across OMOP networks.

## Usage

Some general notes:

* runs non-root: `uid=101(nginx) gid=101(nginx) groups=101(nginx)`
* listens on port `8080`
* requires data directory mounted at `/usr/share/nginx/html/data`

To start the ARES container, you can run the following command:

```sh
docker run \
  --rm \
  --detach \
  --name ares \
  --publish 8080:8080 \
  --volume "$(pwd)/data:/usr/share/nginx/html/data" \
  edence/ohdsi-ares:latest
```

The data extracts for each data source and for networkwide metadata can be generated using the `edence/ohdsi-aresindexer` image created in an adjacent repository: [ohdsi-aresindexer](https://github.com/edencehealth/ohdsi-aresindexer)
