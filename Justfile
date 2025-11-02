name := "PHYS180_Poster_Greco_Daniel"

[private]
default:
    @just --list

# clean build artifacts
[group("Typst")]
clean:
    #!/usr/bin/env bash
    set -euo pipefail
    rm -rf _build

# check formatting
[group("Typst")]
check:
    #!/usr/bin/env bash
    set -euo pipefail
    typstyle --check src/ &> /dev/null

# fix formatting
[group("Typst")]
fix:
    #!/usr/bin/env bash
    set -euo pipefail
    typstyle --inplace --timing src/

# compile in watch mode
[group("Typst")]
watch:
    #!/usr/bin/env bash
    set -euo pipefail
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT SIGINT SIGTERM
    zathura "$tmp/{{name}}.pdf" &
    zathura_pid=$!
    trap 'rm -rf "$tmp"; kill $zathura_pid 2>/dev/null || true' EXIT SIGINT SIGTERM
    typst watch src/main.typ "$tmp/{{name}}.pdf"

# compile
[group("Typst")]
build:
    #!/usr/bin/env bash
    set -euo pipefail
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT SIGINT SIGTERM

    just clean

    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    output="{{name}}_${timestamp}.pdf"

    typst compile src/main.typ "$tmp/$output"
    mkdir -p _build
    mv "$tmp/$output" _build/$output
