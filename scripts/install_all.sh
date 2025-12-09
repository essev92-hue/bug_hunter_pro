#!/bin/bash
# install_all.sh - Instalasi semua tool sekaligus

echo "[*] Membuat struktur folder..."
mkdir -p {tools,configs,reports,wordlists,scripts,logs,results}

echo "[*] Menginstall Go jika belum ada..."
if ! command -v go &> /dev/null; then
    wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    source ~/.bashrc
fi

echo "[*] Menginstall semua tool Go..."
GO_TOOLS=(
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    "github.com/projectdiscovery/katana/cmd/katana@latest"
    "github.com/ffuf/ffuf@latest"
    "github.com/hahwul/dalfox/v2@latest"
    "github.com/tomnomnom/waybackurls@latest"
    "github.com/tomnomnom/gf@latest"
    "github.com/tomnomnom/unfurl@latest"
    "github.com/jaeles-project/gospider@latest"
    "github.com/lc/gau/v2/cmd/gau@latest"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
)

for tool in "${GO_TOOLS[@]}"; do
    echo "  [+] Installing: $(basename $tool)"
    go install $tool
done

# Copy binary ke folder tools
echo "[*] Menyalin binary ke folder tools/"
cp ~/go/bin/* tools/ 2>/dev/null

echo "[*] Mengupdate nuclei templates..."
./tools/nuclei -update-templates
./tools/nuclei -update-templates -ut

echo "[*] Mendownload wordlists..."
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt \
    -O wordlists/common.txt
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-medium-directories.txt \
    -O wordlists/directories.txt
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/burp-parameter-names.txt \
    -O wordlists/parameters.txt

echo "[*] Setup selesai!"
echo "[*] Semua tool tersedia di: $(pwd)/tools/"
