#!/usr/bin/env bash

USAGE="$(cat <<EOF
Usage: $0 <input_dir> <output_dir>

Convert all FLAC files from <input_dir> to mp3 and write them into <output_dir>.
EOF
)"

if [ $# -ne 2 ]; then
    echo "$USAGE" >&2
    exit 1
fi

CONV_APP="${CONV_APP:-avconv}"
INPUT="$1"
OUTPUT="$2"

IFS=$'\n'
for flac_file in $(find "$INPUT" -mindepth 1 -maxdepth 1 -name "*.flac"); do
    base="$(basename "$flac_file" .flac)"
    mp3_file="${OUTPUT}/${base}.mp3"

    echo "Converting '$flac_file'..."
    avconv -y -i "$flac_file" -f mp3 -c:a libmp3lame  -b:a 256k "$mp3_file"
done
