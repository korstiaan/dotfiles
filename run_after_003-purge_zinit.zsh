#!/bin/zsh

(
  source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
  zinit delete --all --quiet --yes
)
