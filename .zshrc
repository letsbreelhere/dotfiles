[[ -r ~/dev/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/dev/znap
zstyle ':znap:*' repos-dir ~/.config/zsh
source ~/dev/znap/znap.zsh
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

# vim keybindings
bindkey -v
# stop ctrl-s from locking input
stty -ixon

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

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

source ~/.zsh/exports.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
#[ -f "/Users/bgardner/.ghcup/env" ] && source "/Users/bgardner/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH"

[ -f "/Users/bgardner/.ghcup/env" ] && source "/Users/bgardner/.ghcup/env" # ghcup-env

export PATH="/usr/local/opt/ruby/bin:$PATH"

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bgardner/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bgardner/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bgardner/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bgardner/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

