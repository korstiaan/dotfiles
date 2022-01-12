#!/bin/bash
set -eo pipefail

pushd "$HOME"

find "./.local/scripts" -type f \( -name "*.sh" -o -name "*.zsh" \) -print0 | xargs -0 -n1 shellcheck -x
shellcheck -x "./.zshrc"

popd
