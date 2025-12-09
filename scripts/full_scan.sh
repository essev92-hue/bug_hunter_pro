#!/bin/bash
# full_scan.sh - Full pipeline scan

DOMAIN=$1
DATE=$(date +%Y%m%d)

echo "[*] Starting full scan for: $DOMAIN"

# Step 1: Passive Recon
./scripts/passive_recon.sh $DOMAIN

# Step 2: Live hosts
echo "[+] Finding live hosts..."
cat targets/recon/all_subs.txt | ./tools/httpx -silent -threads 30 \
    -ports 80,443,8080,8443 -o targets/recon/live_hosts.txt

# Step 3: Nuclei scan
echo "[+] Running nuclei..."
./tools/nuclei -l targets/recon/live_hosts.txt \
    -severity medium,high,critical \
    -etags intrusive \
    -rate-limit 50 \
    -c 20 \
    -o targets/results/nuclei_$DATE.txt

echo "[+] Scan completed!"
