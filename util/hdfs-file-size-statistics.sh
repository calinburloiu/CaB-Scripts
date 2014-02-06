#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

if [ $# -ne 2 ]; then
	echo "Usage: $0 DIRECTORY [GREP_PATTERN]" >&2
	echo -e "Print file size statistics for files from HDFS DIRECTORY filtering results\n"\
"by the optional GREP_PATTERN." >&2
	exit 1
fi

DIR="$1"
if [ $# -eq 2 ]; then
	PATT="$2"
else
	PATT="*"
fi

IFS=$'\n'

hdfs dfs -ls -R "$DIR" | grep "$PATT" | tr -s " " "*" | awk -F '*' -f file-size-statistics.awk
