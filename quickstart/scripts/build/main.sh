#!/usr/bin/env bash
set -euxo pipefail

dir="$(dirname "$0")"
index="$dir/../../content-org/index.org"


# emacs --batch --visit "$index" --script "$dir/main.el" --kill

# rm -f content/**/*.md~
