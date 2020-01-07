# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
# Add npm bins to path if they're available
if [[ ! `type npm > /dev/null` ]]; then;
  export PATH="$(npm bin -g 2>/dev/null):$PATH"
  export PATH="$(npm bin):$PATH"
fi
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/dev-env/bin:$PATH"
