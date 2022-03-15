# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR=nvim

# Paths
export PATH="$HOME/.local/bin:$PATH"
# Add npm bins to path if they're available
if [[ ! `type npm > /dev/null` ]]; then;
  export PATH="$(npm bin -g 2>/dev/null):$PATH"
  export PATH="$(npm bin):$PATH"
fi
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/dev-env/bin:$PATH"
export PATH="$HOME/dev/jenkins-shared-libraries/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PWD/.local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
