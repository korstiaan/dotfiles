if [[ -n $SSH_CONNECTION ]]; then
  source "$HOME/.p10k.remote.zsh"
else
  source "$HOME/.p10k.local.zsh"
fi
