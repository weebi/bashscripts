#!/bin/bash

# Shows tracking data from 4px corresponding to the ID given as input
trackinginfo() {
	[[ -z "${1}" ]] && echo "Usage: ${0} <ID>"

	# Fetch tracking data from 4px
	local trackingData=$(curl -s http://track.4px.com/track/v2/front/listTrack -d "{\"serveCodes\":[\"${1}\"],\"language\":\"en-us\"}" -H 'Content-Type: application/json')

	# Parse tracking data and display as a neat list.
	[[ -n "${trackingData}" && ! $(echo "${trackingData}" | jq .data[].status) -eq 0 ]] && echo "${trackingData}" | jq -r '"\(.data[].queryCode)\n\(.data[].ctStartName) -> \(.data[].ctEndName)\nDuration: \(.data[].duration) days\n ","[i] \(.data[].tracks[] | .tkDesc + if .tkLocation != "" then " / " + .tkLocation else null end)"' || echo "Error, nonexistent tracking code or network error" > /dev/stderr
}

trackinginfo "${1}"