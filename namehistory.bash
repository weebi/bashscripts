#!/bin/bash

# Gets name history of the selected user if it exists
namehistory() {
	[[ -z "${1}" ]] && echo "Usage: ${0} <username>" && exit 1

	# Due to how Mojang's API works, we need to turn the username into an ID first
	local userId=$(curl -s "https://api.mojang.com/users/profiles/minecraft/${1}" | jq -r .id)

	[[ -n "${userId}" ]] && curl -s "https://api.mojang.com/user/profiles/${userId}/names" | jq -r ".[] | .name" || echo "Error in fetching data, either the account doesn't exist or you're disconnected from the internet" > /dev/stderr 
}

namehistory "${1}"
