#!/bin/sh
if [ ! -f $HOME/.fzf.zsh ]; then
  $HOME/.local/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish > /dev/null
fi
