#!/bin/bash

# if alias points to script, show contents
function check_alias(){
    [[ -n "${1}" && $(alias "${1}" | sed -e 's|['\''"]$||g' | grep -o ...$) == ".sh" ]] && cat $(alias "${1}" | sed -e 's|\w.*=['\''"]||g' -e 's|['\''"]$||g' -e 's| |\\ |g')
}

check_alias "${1}"
