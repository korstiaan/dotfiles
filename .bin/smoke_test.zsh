#!/bin/zsh
# shellcheck shell=bash

echo "neovim"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
nvim --headless -c 'quitall'

# shellcheck source=.zshrc
source "$HOME/.zshrc"
set -e

echo "asdf"
asdf --version

echo "z"
command -v z > /dev/null

echo "fzf"
fzf --version

echo "node"
node --version

echo "go"
go version

echo "ruby"
ruby -v
