#!/bin/bash

# Displays usage and possibly future help screen
usage() {
	echo "Script usage: "
	echo -e "\t$ ${0} <tld>"
}

main() {
	# If we get no input, show usage
	[[ -z "${1}" ]] && usage && exit

	# Downloads the list of valid TLDs from IANA, if fails, exits
	local tldList="$(curl -s https://data.iana.org/TLD/tlds-alpha-by-domain.txt)"
	[[ -z "${tldList}" ]] && echo "[E] Error, check your connection and try again later." > /dev/stderr && exit

	# Checks if input string is in the list
	[[ $(echo "${tldList}" | grep -qi "\\s${1}\\s") -eq 0 ]] && echo "[i] .${1} is a valid TLD!" || echo "[E] .${1} is not a valid TLD." > /dev/stderr

}

main "${1}"
