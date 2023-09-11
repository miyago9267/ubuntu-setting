#!/bin/bash

export CF_Key=""
export CF_Email=""
export CF_Account_ID=""
export CF_Zone_ID=""
export CF_TOKEN=""

DOMAIN=""

if [ -z "${DOMAIN}" ]; then
    echo "\033[0;31mERROR:\033[0m Please set Config DOMAIN in scripts/acme.sh first!"
    exit 1
fi

mkdir -p /etc/nginx/certs
mkdir -p /etc/nginx/certs/${DOMAIN}
touch /etc/nginx/certs/${DOMAIN}/${DOMAIN}-cert.crt
touch /etc/nginx/certs/${DOMAIN}/${DOMAIN}.key
touch /etc/nginx/certs/${DOMAIN}/${DOMAIN}-fullchain.crt
touch /etc/nginx/certs/${DOMAIN}/${DOMAIN}-ca.crt

/root/.acme.sh/acme.sh --issue --force -d "*.${DOMAIN}" -d "${DOMAIN}" --dns dns_cf --log \
--cert-file "/etc/nginx/certs/${DOMAIN}/${DOMAIN}-cert.crt" \
--key-file "/etc/nginx/certs/${DOMAIN}/${DOMAIN}.key" \
--fullchain-file "/etc/nginx/certs/${DOMAIN}/${DOMAIN}-fullchain.crt" \
--ca-file "/etc/nginx/certs/${DOMAIN}/${DOMAIN}-ca.crt" \
--reloadcmd "systemctl reload nginx"