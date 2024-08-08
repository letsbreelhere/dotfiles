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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
