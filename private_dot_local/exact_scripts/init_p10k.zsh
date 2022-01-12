# shellcheck shell=bash
if [[ -n $SSH_CONNECTION ]]; then
  # shellcheck source=/dev/null
  source "$HOME/.p10k.remote.zsh"
else
  # shellcheck source=/dev/null
  source "$HOME/.p10k.local.zsh"
fi
