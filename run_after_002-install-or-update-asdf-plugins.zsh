#!/bin/zsh
set -euo pipefail
(
  set +u;. "$HOME/.local/scripts/init_asdf.zsh"; set -u

  export GITHUB_API_TOKEN=${GITHUB_API_TOKEN:-${GITHUB_TOKEN:+$GITHUB_TOKEN}}

  export NODE_BUILD_DEFINITIONS="$HOME/.config/node-build"

  "$HOME/.local/share/node-build-update-defs/bin/nodenv-update-version-defs" -d "$NODE_BUILD_DEFINITIONS"

  install_asdf_plugin() {
    if ! asdf plugin list | grep -q "^$1$"; then
      asdf plugin add $1
    else
      asdf plugin update $1
    fi

    local version=$2

    if [ $version = 'latest' ]; then
      version=$(asdf latest $1)
    fi

    asdf install $1 $version
    asdf global $1 $version
  }

  install_asdf_plugin ruby latest
  install_asdf_plugin nodejs latest
  install_asdf_plugin python latest
  install_asdf_plugin kubectl latest
  install_asdf_plugin java openjdk-17.0.1
  install_asdf_plugin awscli latest
  install_asdf_plugin golang latest
  install_asdf_plugin helm latest
)
