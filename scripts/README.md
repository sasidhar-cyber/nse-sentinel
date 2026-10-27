# NSE Starter Scripts

These low-impact examples are for isolated, authorized labs. Review and validate them with your installed Nmap version before use.

- http-security-headers.nse — observes selected HTTP response security headers.
- http-server-disclosure.nse — reports the HTTP Server response header when present.
- ssh-banner-review.nse — reports Nmap SSH service metadata for inventory review.

## Usage (authorized lab only)

    nmap -sV --script ./scripts/http-security-headers.nse -p 80,443 <LAB_IP>
    nmap -sV --script ./scripts/http-server-disclosure.nse -p 80,443 <LAB_IP>
    nmap -sV --script ./scripts/ssh-banner-review.nse -p 22 <LAB_IP>

A missing header or service banner alone does not prove exploitability.
