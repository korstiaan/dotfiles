#!/bin/zsh
set -eo pipefail

. "$HOME/.local/scripts/init_asdf.zsh"

set -u

_asdf_with_env() {
  GITHUB_API_TOKEN=${GITHUB_API_TOKEN:-${GITHUB_TOKEN:+$GITHUB_TOKEN}} asdf "$@"
}

install_asdf_plugin() {
  if ! asdf plugin list | grep -q "^$1$"; then
    _asdf_with_env plugin add $1
  else
    _asdf_with_env plugin update $1
  fi

  local version=$2

  if [ $version = 'latest' ]; then
    version=$(_asdf_with_env latest $1)
  fi

  _asdf_with_env install $1 $version
  _asdf_with_env global $1 $version
}

install_asdf_plugin ruby latest
install_asdf_plugin nodejs latest
install_asdf_plugin python latest
install_asdf_plugin kubectl latest
install_asdf_plugin java openjdk-17.0.1
install_asdf_plugin awscli latest
install_asdf_plugin golang latest
install_asdf_plugin helm latest
