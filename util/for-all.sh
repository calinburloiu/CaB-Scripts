#!/usr/bin/env bash
#
# Author: Calin-Andrei Burloiu
#

HELP=`cat <<EOF
Usage: $0 EXEC PATH PATTERN [ARG2 ARG3 ...]

Call EXEC with first argument as each file found in PATH that matches PATTERN.
The next arguments will be ARG2, ARG3...
Current directory will be changed to the one of EXEC.
EOF`

if [ $# -lt 3 ]; then
	echo "$HELP" >&2
	exit 1
fi

EXEC="$1"
EXEC_FILE="$(basename "$EXEC")"
EXEC_DIR="${EXEC%/*}"
PTH="$2"
PTRN="$3"
shift 3

cd "$EXEC_DIR"
IFS=$'\n'

for file in $(find "$PTH" -iname "$PTRN"); do
    bash $EXEC_FILE "$file" $@
done
