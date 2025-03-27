#!/bin/sh
set -eu

sed -i '/server\s*{/a \    include /etc/nginx/env_endpoint.conf;' \
  /etc/nginx/conf.d/default.conf
