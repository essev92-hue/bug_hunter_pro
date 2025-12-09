#!/bin/bash
echo "🔍 Monitoring nuclei scan..."
echo "Start: $(date)"

while true; do
    if [ -f "targets/results/nuclei_theoriginals.io.txt" ]; then
        count=$(wc -l < targets/results/nuclei_theoriginals.io.txt)
        echo "⏳ Found so far: $count vulnerabilities"
        echo "Last update: $(stat -c %y targets/results/nuclei_theoriginals.io.txt 2>/dev/null || echo 'No file')"
    else
        echo "⏳ Scan in progress... (no results file yet)"
    fi
    
    # Cek jika nuclei masih jalan
    if ! pgrep -x "nuclei" > /dev/null; then
        echo "✅ Scan completed!"
        break
    fi
    
    sleep 10
done
