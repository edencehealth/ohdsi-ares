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

The data extracts for each data source can be generated following the instructions here: [ares github docs](https://github.com/OHDSI/Ares/blob/main/docs/index.md)

Good luck!
