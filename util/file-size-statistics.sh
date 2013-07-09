#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

if [ $# -ne 2 ]; then
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

#ls -l $(find "$DIR" -name "$PATT") | tr -s " " "*" | awk -F '*' 'BEGIN { max = -1; maxFile = "-" }; { if ($5 > max) { max = $5; maxFile = $9 } }; END { print max, "\t", maxFile }'
ls -l $(find "$DIR" -name "$PATT") | tr -s " " "*" | awk -F '*' -f file-size-statistics.awk
