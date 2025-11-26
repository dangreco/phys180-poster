#!/usr/bin/env bash
tmp=$(mktemp -d)

function usage() {
    echo "Usage: test.sh <src>"
    exit 1
}

function cleanup() {
    rm -rf "$tmp"
}
trap cleanup EXIT SIGINT SIGTERM

SRC="$1"

if [[ -z "$SRC" ]]; then
    echo "Error: specify <src>"
    usage
fi

if [ ! -f "$SRC" ]; then
    echo "Error: Source file '$SRC' does not exist."
    usage
fi

# Build document
mkdir -p "$(dirname "$DST")"
typst compile "$SRC" "$tmp/main.pdf"
test -f "$tmp/main.pdf"
