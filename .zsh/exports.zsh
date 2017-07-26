# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"
export PATH="$HOME/.local/bin:$PATH"

if [[ -x "npm" ]]; then
  export PATH="$(npm bin):$PATH"
fi
