# NSE Sentinel — Custom Nmap NSE Security Assessment Toolkit

A student project to develop documented Nmap Scripting Engine (NSE/Lua) checks, demonstrate them in authorized lab environments, and prepare structured security assessment reports.

## Features
- Interactive dashboard with script library, findings, methodology, and report builder.
- Lab scan planner generates commands for manual execution; the website does not run Nmap.
- Three low-impact NSE starter examples for HTTP headers, HTTP Server header, and SSH service metadata.
- CSV export for illustrative findings and standalone HTML report template export.
- Lab workflow and report template documentation.
- GitHub Pages deployment workflow.

## Layout
- index.html — interactive website.
- scripts/ — NSE/Lua starter scripts and usage notes.
- docs/lab-workflow.md — authorized lab workflow.
- docs/report-template.md — structured report template.
- .github/workflows/pages.yml — Pages deployment workflow.

## Example command
Only run against a system you own or have explicit permission to test. 192.0.2.10 is reserved for documentation examples.

    nmap -sV --script ./scripts/http-security-headers.nse -p 80,443 192.0.2.10

Review scripts in an isolated lab first. Nmap must be run locally. Missing headers or service banners alone do not prove exploitability.

## Deployment
GitHub Pages is configured to deploy the root directory on pushes to main. After the workflow succeeds, the site URL is https://sasidhar-cyber.github.io/nse-sentinel/

## Safety
Authorized lab use only. No exploitation, credential guessing, stealth, persistence, or public-target scanning.
