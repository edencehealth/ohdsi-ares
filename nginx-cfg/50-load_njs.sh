#!/bin/sh
set -eu

# if you want to refer to an envvar in njs, you need to include it in the list below
# see: https://nginx.org/en/docs/ngx_core_module.html#env

NGINX_CONF=$(cat /etc/nginx/nginx.conf)

printf '%s\n' \
  "load_module modules/ngx_http_js_module.so;" \
  "env CDM_NETWORK_NAME;" \
  "env DUCKDB_ENABLED;" \
  "env WEB_API_ENABLED;" \
  "env WEB_API_URL;" \
  "$NGINX_CONF" \
  >/etc/nginx/nginx.conf
