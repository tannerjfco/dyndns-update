# DynDNS Cron Container for afraid.org

This is a simple container to check and update as needed a DNS record on afraid.org. The container runs a crontab that runs every 15 minutes.

The following environment variables are required to be set on the container:

- `DOMAIN` - The domain name to check for any required record update
- `APIKEY` - The afraid.org API Key required to update the record

To run in docker command line:

```
docker run --name dyndns -d -it -e DOMAIN=mydomain.mooo.com -e APIKEY=myapikey tannerjfco/dyndns-update:latest
```

To run in docker-compose:

```
version: "3"
services:
  dyndns:
    container_name: dyndns
    image: tannerjfco/dyndns-update
    restart: unless-stopped
    environment:
      DOMAIN: $DDNS_DOMAIN
      APIKEY: $DDNS_APIKEY
```