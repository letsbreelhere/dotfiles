HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

source ~/.zsh/autoload.zsh
source ~/.zsh/opts.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/vcs.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/secrets.zsh

bindkey -v
bindkey '^R' history-incremental-search-backward

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

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(direnv hook zsh)"
source ~/.zsh/exports.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
[ -f "/Users/bgardner/.ghcup/env" ] && source "/Users/bgardner/.ghcup/env" # ghcup-env
