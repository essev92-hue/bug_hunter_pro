#!/bin/bash
# quick_scan.sh - Quick vulnerability scan

DOMAIN=$1
echo "[*] Quick scan untuk: $DOMAIN"

# Cek jika live hosts ada
if [ -f "targets/recon/live_hosts.txt" ]; then
    echo "[+] Menjalankan nuclei quick scan"
    ./tools/nuclei -l targets/recon/live_hosts.txt \
        -severity high,critical \
        -etags intrusive \
        -rate-limit 30 \
        -c 10 \
        -timeout 5 \
        -o targets/results/quick_scan.txt
        
    echo "[+] Hasil: targets/results/quick_scan.txt"
else
    echo "[!] File live_hosts.txt tidak ditemukan"
    echo "[!] Jalankan recon terlebih dahulu: ./scan_runner.sh $DOMAIN recon"
fi
