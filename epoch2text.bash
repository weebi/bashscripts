#!/bin/bash

# This script turns the Unix epoch (e.g 1699804041)
# into word form. This script has no real use case,
# but I wanted to make it anyway. Have fun with it!

epoch2text() {
  declare epoch
  declare -i length
  declare -A words
  declare final

  # The base Unix epoch
  epoch="$(date +%s)"

  # Word translation table
  words+=( [0]="zero"  [1]="one"   )
  words+=( [2]="two"   [3]="three" )
  words+=( [4]="four"  [5]="five"  )
  words+=( [6]="six"   [7]="seven" )
  words+=( [8]="eight" [9]="nine"  )

  # Iterate through every number and translate
  length="${#epoch}"
  for ((i = 0; i < length; i++)); do
    char="${epoch:i:1}"
    final+="${words[$char]} "
  done

  # Print the final product
  echo "$final"
}

epoch2text "$@"
