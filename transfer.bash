#!/bin/bash

# upload file to https://transfer.sh
transfer() {
	# Check if we get input
	[[ -z "${1}" ]] && echo "Usage: ${0} /project/src/index.js" && exit

	# Check if the file exists and that we have read permissions to it
	[[ ! -r "${1}" ]] && echo "File either doesn't exist or we don't have read permission to it."

	# Try uploading the file, complain if failed
	local url=$(curl -sT "${1}" "https://transfer.sh/${1}")
	[[ -n "${url}" ]] && echo "${url}" || echo "Unexpected error, check your internet connection" > /dev/stderr
}

transfer "${1}"
