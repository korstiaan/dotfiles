#!/bin/zsh
# shellcheck shell=bash

(
  # shellcheck source=.local/share/zinit/zinit.git/zinit.zsh disable=SC1094
  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  zinit delete --all --quiet --yes
)
