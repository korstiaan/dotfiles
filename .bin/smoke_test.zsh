#!/bin/zsh
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
