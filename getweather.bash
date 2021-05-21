#!/bin/bash

downloadWeather() {
	# Download weather data, exit if we encounter any errors
	local weatherData=$(curl -s "https://v2.wttr.in/${1}?0qmMn" | tail -n 5)
	[[ -n "${weatherData}" ]] && echo "${weatherData}" || exit 1
}

# Fetch weather from wttr.in, cache it for 30 minutes
weather() {
	# Fetch new data if the file doesn't exist or it's older than 30 minutes
	[[ ! -f "${HOME}/.weather" || $(find ~/.weather -mmin +30) ]] && newWeatherData=$(downloadWeather "${1}")

	# If new data is set, insert it into the file in ~/
	[[ -n "${newWeatherData}" ]] && echo "${newWeatherData}" > ~/.weather

	# Finally, we print the contents of the weather file
	cat ~/.weather
}

weather "${1}"
