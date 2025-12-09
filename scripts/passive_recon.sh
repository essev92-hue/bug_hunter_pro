#!/bin/bash
# passive_recon.sh - Reconnaissance pasif

DOMAIN=$1
OUTPUT="targets/recon"

echo "[*] Starting passive recon for: $DOMAIN"

# Subdomain enumeration
echo "[+] Running subfinder..."
./tools/subfinder -d $DOMAIN -silent -o $OUTPUT/subfinder.txt

echo "[+] Running assetfinder..."
./tools/assetfinder --subs-only $DOMAIN > $OUTPUT/assetfinder.txt

# Merge results
cat $OUTPUT/*.txt | sort -u > $OUTPUT/all_subs.txt
echo "[+] Total subdomains: $(wc -l $OUTPUT/all_subs.txt | awk '{print $1}')"
