description = [[Reports selected HTTP response security headers for authorized lab review. Missing headers alone do not prove a vulnerability.]]
author = "NSE Sentinel Project"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"safe", "discovery"}
local http = require "http"
local shortport = require "shortport"
portrule = shortport.http
action = function(host, port)
  local response = http.get(host, port, "/")
  if not response then return "No HTTP response received for /; verify service and path." end
  local headers = response.header or {}
  local wanted = {"strict-transport-security","content-security-policy","x-content-type-options","x-frame-options","referrer-policy"}
  local lines = {"HTTP security-header observations for /:"}
  for _, name in ipairs(wanted) do
    local value = headers[name]
    if value then table.insert(lines, string.format("  %s: %s", name, tostring(value)))
    else table.insert(lines, string.format("  %s: NOT OBSERVED", name)) end
  end
  table.insert(lines, "Interpret results in context; some headers apply only to HTTPS or specific applications.")
  return table.concat(lines, "\n")
end
