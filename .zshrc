HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

source ~/.zsh/exports.zsh
source ~/.zsh/autoload.zsh
source ~/.zsh/opts.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/vcs.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/secrets.zsh

# vim keybindings
bindkey -v
# stop ctrl-s from locking input
stty -ixon

# NB: Must come after vim bindings
source ~/.zsh/fzf.zsh

# Don't know why this doesn't happen by default.
# Fixes an issue with backspace in normal mode with vi-mode enabled.
# cf. https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
bindkey "^?" backward-delete-char

chpwd_functions=("chpwd")

# Source local scripts in `./.zsh_config` if present
function chpwd() {
  if [ -r $PWD/.zsh_config ]; then
    source $PWD/.zsh_config
  fi
}

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

export PATH="/usr/local/opt/ruby/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
source $ACADEMIA_SHELL/academia-shell.sh

eval "$(rbenv init - zsh)"
