#!/bin/bash
# dns enumeration helper
# usage: ./dns_enum.sh <domain>

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
    echo "usage: dns_enum.sh <domain>"
    exit 1
fi

echo "[*] DNS Enumeration for $DOMAIN"
echo "================================"

echo -e "\n[+] A Records:"
dig +short A $DOMAIN

echo -e "\n[+] MX Records:"
dig +short MX $DOMAIN

echo -e "\n[+] TXT Records:"
dig +short TXT $DOMAIN

echo -e "\n[+] NS Records:"
dig +short NS $DOMAIN

echo -e "\n[+] Common Subdomains:"
for sub in www dev mail admin api ftp test staging; do
    result=$(dig +short A $sub.$DOMAIN)
    if [ ! -z "$result" ]; then
        echo "  $sub.$DOMAIN -> $result"
    fi
done
