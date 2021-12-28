#!/bin/zsh
set -euo pipefail
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

ASDF_DIR="$HOME/.asdf"

if [ ! -d $ASDF_DIR ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
  git -C $ASDF_DIR checkout $(git describe --tags --abbrev=0)
fi

set +u;. $ASDF_DIR/asdf.sh; set -u
asdf update

install_asdf_plugin ruby latest
install_asdf_plugin nodejs latest
install_asdf_plugin python latest
install_asdf_plugin kubectl latest
install_asdf_plugin java openjdk-17.0.1
install_asdf_plugin awscli latest
install_asdf_plugin golang latest
install_asdf_plugin helm latest
