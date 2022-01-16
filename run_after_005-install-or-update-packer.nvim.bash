#!/bin/bash
set -euo pipefail

PACKER_LOCATION="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -d "$PACKER_LOCATION" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    "$PACKER_LOCATION"
else
  git -C "$PACKER_LOCATION" pull
fi

