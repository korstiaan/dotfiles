export ASDF_DATA_DIR="$HOME/.local/asdf"

. "$HOME/.asdf/asdf.sh"
fpath=("$ASDF_DIR/completions" $fpath)
autoload -Uz compinit && compinit
