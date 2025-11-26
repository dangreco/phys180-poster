#!/usr/bin/env bash
function usage() {
    echo "Usage: build.sh <src> <dst>"
    exit 1
}

SRC="$1"
DST="$2"

if [[ -z "$SRC" ]]; then
    echo "Error: specify <src>"
    usage
fi

if [[ -z "$DST" ]]; then
    echo "Error: specify <dst>"
    usage
fi

if [ ! -f "$SRC" ]; then
    echo "Error: Source file '$SRC' does not exist."
    usage
fi

# Build document
mkdir -p "$(dirname "$DST")"
typst compile "$SRC" "$DST"
