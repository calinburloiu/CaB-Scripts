#!/usr/bin/env bash

USAGE=$"$(cat <<EOF
Usage: $0 <license_header_file> <skip_pattern> <target_dir> <source_find_pattern>

Add the content of the <license_header_file> to all source files which match
find command pattern <source_find_pattern>. <skip_pattern> should be a pattern
used by grep to identify if the source file already has the license header in
order to be skipped.
EOF
)"

if [ $# -ne 4 ]; then
    echo "$USAGE" >&2
    exit 10
fi
HEADER="$1"
SKIP_PATTERN="$2"
TARGET="$3"
PATTERN=$4

IFS=$'\n'
for src in $(find "$TARGET" -name "${PATTERN}"); do
    if [ -z "$(grep "$SKIP_PATTERN" "$src")" ]; then
        cat "$HEADER" "$src" > "${src}.tmp"
        mv "${src}.tmp" "$src"
        echo "Added to '$src'."
    else
        echo "Skipped '$src'."
    fi
done

