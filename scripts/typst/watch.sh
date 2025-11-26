#!/usr/bin/env bash
function usage() {
    echo "Usage: watch.sh <src> <dst>"
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

mkdir -p "$(dirname "$DST")"

proc1() {
    typst watch "$SRC" "$DST"
}

proc2() {
    viewers=(evince okular zathura mupdf xpdf)

    while [ ! -f "$DST" ]; do
        sleep 0.1
    done

    for viewer in "${viewers[@]}"; do
        if command -v "$viewer" &>/dev/null; then
            "$viewer" "$DST"
            break
        fi
    done
}

export -f proc1
export -f proc2
export SRC DST
parallel --halt now,done=1 ::: proc1 proc2
