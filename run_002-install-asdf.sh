#!/bin/zsh
set -euo pipefail
install_asdf_plugin() {
  if ! asdf plugin list | grep -q "^$1$"; then
    asdf plugin add $1
  fi
}

ASDF_DIR="$HOME/.asdf"

if [ ! -d $ASDF_DIR ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
  git -C $ASDF_DIR checkout $(git describe --tags --abbrev=0)
fi

set +u;. $ASDF_DIR/asdf.sh; set -u
asdf update

install_asdf_plugin ruby
install_asdf_plugin nodejs
install_asdf_plugin python
install_asdf_plugin kubectl
install_asdf_plugin java
install_asdf_plugin awscli
install_asdf_plugin golang

asdf plugin update --all
asdf install
