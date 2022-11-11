local requests = 100000000000000000000000000000000
local ip = '' -- ip here
local http = require("socket.http")
local count = 0

for i=1, requests do
	count = count + 1
	http.request(ip)
	print(ip.." | HTTP(s) Request Sent ("..count..")")
end
