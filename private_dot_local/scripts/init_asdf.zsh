export ASDF_DATA_DIR="$HOME/.local/asdf"

. "$HOME/.asdf/asdf.sh"

if [[ -o login ]]; then
  fpath=("$ASDF_DIR/completions" $fpath)
fi
