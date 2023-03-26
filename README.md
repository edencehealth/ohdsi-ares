# ohdsi-ares

Dockerization of the Ares application designed to monitor data quality across OMOP networks

To deploy the ARES container, you can run the following command in this directory:

```
sudo docker run --rm -d \
    --name ares \
    -p 7070:80 \
    -v <path to local data dir>:/usr/share/nginx/html/data \
    edence/ohdsi-ares:latest
```

The data extracts for each data source and for networkwide metadata can be generated using the `edence/ohdsi-aresindexer` image created in an adjacent repository: [ohdsi-aresindexer](https://github.com/edencehealth/ohdsi-aresindexer)

Good luck!
