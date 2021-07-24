#!/bin/bash

source /etc/os-release

b=$'\033[m'
y=$'\033[1;33m'

cpu=$(grep "model name" < /proc/cpuinfo | head -1)
shell=$(basename $SHELL)

cat<< END

  $y"$b $(fortune) $y"$b

${y}SHELL: $b$shell	 ${y}Distro: $b$PRETTY_NAME
${y}User: $b$USER	 ${y}CPU: $b${cpu:13} 
END