description = [[Reports Nmap service metadata for SSH inventory in an authorized lab. Does not attempt authentication or exploit the service.]]
author = "NSE Sentinel Project"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"safe", "discovery"}
local shortport = require "shortport"
portrule = shortport.ssh
action = function(host, port)
  local product = port.version and port.version.product
  local version = port.version and port.version.version
  if product or version then
    return string.format("Nmap service metadata: %s %s\nValidate against the actual SSH identification string before drawing conclusions.", tostring(product or "SSH"), tostring(version or ""))
  end
  return "SSH service detected; version metadata unavailable. Validate in the lab."
end
