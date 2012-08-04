#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

if [ $# -ne 2 ]; then
	echo "usage: $0 HAYSTACK_PATH NEEDLE" >&2
	echo -e "Grep through the list of files packed into JARs from\n"\
"HAYSTACK_PATH." >&2
	exit 1
fi

HAYSTACK="$1"
NEEDLE="$2"

IFS=$'\n'

for i in $(find $HAYSTACK -name "*.jar"); do
	if [[ $(jar -tf "$i" | grep "$NEEDLE") ]]; then
		echo "$i"
	fi
done
