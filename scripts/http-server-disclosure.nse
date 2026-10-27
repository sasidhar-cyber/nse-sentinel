description = [[Reports the HTTP Server response header for authorized lab inventory and information-exposure review. No exploitation or authentication attempts are performed.]]
author = "NSE Sentinel Project"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"safe", "discovery"}
local http = require "http"
local shortport = require "shortport"
portrule = shortport.http
action = function(host, port)
  local response = http.get(host, port, "/")
  if not response then return "No HTTP response received for /." end
  local value = (response.header or {})["server"]
  if value then return "Observed Server header: " .. tostring(value) .. "\nA banner alone is not a vulnerability." end
  return "No Server response header observed on /."
end
