#!/bin/bash
set -eo pipefail

curl ${GITHUB_TOKEN:+ -H "Authorization: Bearer ${GITHUB_TOKEN}"} "https://api.github.com/repos/asdf-vm/asdf/tags?per_page=1"
