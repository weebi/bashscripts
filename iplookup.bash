iplookup() {
	curl -s https://ipinfo.io/"${1}" | jq -r '"IP: \(.ip)","Hostname: \(.hostname)","Location: \(.city), \(.region), \(.country)","Organization: \(.org)"'
}

iplookup "${1}"