#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

if [ $# -ne 2 ]; then
	echo "usage: $0 ALT_FILE PRIORITY" >&2
	echo -e "Install alternatives for more applications read from a text file\n"\
"where the first column contains names and the second paths.\n"\
"Check 'man update-alternatives'" >&2
	exit 1
fi

ALT_FILE="$1"
PRIORITY=$2

IFS=$'\n'

for i in $(cat "$ALT_FILE"); do
	name=$(echo "$i" | cut -f1 -d' ')
	path=$(echo $i | cut -f2 -d' ')
	update-alternatives --install /usr/bin/$name $name $path $PRIORITY
done
