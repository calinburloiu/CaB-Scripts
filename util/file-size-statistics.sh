#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

if [ $# -lt 1 ]; then
	echo "Usage: $0 DIRECTORY [SEARCH_PATTERN]" >&2
	echo -e "Print file size statistics for files from DIRECTORY filtering results\n"\
"by the optional SEARCH_PATTERN." >&2
	exit 1
fi

DIR="$1"
if [ $# -eq 2 ]; then
	PATT="$2"
else
	PATT="*"
fi

IFS=$'\n'

ls -l --time-style iso $(find "$DIR" -name "$PATT") | tr -s " " "*" | awk -F '*' -f file-size-statistics.awk
