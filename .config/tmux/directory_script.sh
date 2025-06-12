#!/bin/sh
path=$(echo "$1" | sed 's/[[:space:]]//g')
fixed_length=$2
if [ ${#path} -gt "$fixed_length" ]; then
	path=$(echo "$path" | tail -c "$fixed_length")
	if ! [[ "$path" =~ ^//* ]]; then
		path="/${path#*/}"
	fi
	path="...$path"
fi
echo $path
