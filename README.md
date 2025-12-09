# 🐛 Bug Hunting Toolkit for Android (UserLand)

A comprehensive bug hunting automation pipeline optimized for Android devices running UserLand terminal.

## 🚀 Features

- **7 Integrated Tools**: assetfinder, dalfox, ffuf, httpx, katana, nuclei, subfinder
- **Android Optimized**: Resource-aware scanning for mobile devices
- **Full Pipeline**: Recon → Crawling → Vulnerability Scanning → Reporting
- **Safe Scanning**: Rate-limited, non-intrusive scanning
- **Automated Reports**: Markdown reports with findings

## 📦 Tools Included

| Tool | Purpose | Status |
|------|---------|--------|
| assetfinder | Subdomain discovery | ✅ |
| subfinder | Subdomain enumeration | ✅ |
| httpx | HTTP probing & live host detection | ✅ |
| nuclei | Vulnerability scanning | ✅ (Android-optimized) |
| katana | Web crawling | ✅ |
| dalfox | XSS scanning | ✅ |
| ffuf | Directory fuzzing | ✅ |

## ⚡ Quick Start



📊 Sample Output

╔══════════════════════════════════════╗
║      BUG HUNTING TOOLKIT v1.0        ║
║      Security Researcher Tools       ║
╚══════════════════════════════════════╝

[*] Target: example.com
[*] Mode: full

📊 RESULTS SUMMARY:
   • Subdomains found: 42
   • Live hosts: 18
   • Crawled URLs: 527
   • Critical findings: 2
   • XSS findings: 3
