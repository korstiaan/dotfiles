#!/bin/bash
set -euo pipefail
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
else
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
fi
