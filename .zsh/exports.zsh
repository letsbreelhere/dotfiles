# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR=nvim

# Paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/dev-env/bin:$PATH"
export PATH="$HOME/dev/jenkins-shared-libraries/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PWD/.local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=".venv/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"

export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Handle tmux env refresh
if [ -n "$TMUX" ]; then
  export $(tmux show-env | grep '^AWS')
fi
