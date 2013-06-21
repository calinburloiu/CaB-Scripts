#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <input_dir> <output_dir> <slice_count>" >&2
    echo "Shuffle the files inside <input_dir> and distribute then evenly"
    echo "in <slice_count> output dirs located in <output_dir> and named"
    echo "slice00, slice01..."
    exit 1
fi

IN="$1"
OUT="$2"
COUNT="$3"

IFS=$'\n'

# Create output dirs.
for i in $(seq -f "%02g" 1 $COUNT); do
    mkdir -p "$OUT/slice${i}"
done

# Shuffle input files.
in_files=$(find "$IN" -name "*" -type f | shuf)

i=0
for file in $in_files; do
    slice_id=$(printf "%02g" $(($i%$COUNT+1)))
    slice_dest="${OUT}/slice${slice_id}/"
    echo "Moving '$file' to '$slice_dest'..."
    mv "$file" "$slice_dest"
    i=$(($i+1))
done
