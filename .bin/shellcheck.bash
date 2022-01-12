#!/bin/bash
set -eo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

function find_internals() (
  while read -r line; do
    local pattern="$SOURCE_DIR/${line#/}"
    if [ -f "$pattern" ]; then
      case "$pattern" in
        *.sh | *.zsh | *.bash)
          echo "$pattern";
      esac
    elif [ -d "$pattern" ]; then
      find "$pattern" -type f \( -name "*.bash" -o -name "*.sh" -o -name "*.zsh" \) -print
    fi
  done < .chezmoiignore
)

function find_run_scripts() (
  find "$SOURCE_DIR" -type f \
    \( \
      -name "run_*.sh.tmpl" -o -name "run_*.zsh.tmpl" -o -name "run_*.bash.tmpl" \
      -o -name "run_*.sh" -o -name "run_*.zsh" -o -name "run_*.bash" \
    \) \
    -print0 | while read -r -d $'\0' file
  do
    dest="$TMPDIR/$(basename "${file%\.tmpl}")"
    "$HOME/bin/chezmoi" execute-template < "$file" > "$dest"
    echo "$dest"
  done
)

function find_home_scripts() (
  find "$HOME/.local/scripts" -type f \
    \( -name "*.sh" -o -name "*.zsh" -o -name "*.bash" \) \
    -print
  echo "$HOME/.zshrc"
)

function _shellcheck() (
  echo -n "."
  shellcheck -P "$HOME" -x "$1"
)

for file in $(find_run_scripts) $(find_internals) $(find_home_scripts); do
  _shellcheck "$file" || ret=$?
done

exit $ret
