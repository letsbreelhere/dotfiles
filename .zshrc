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
source ~/.zsh/exports.zsh
source ~/.zsh/commands.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

chpwd_functions=("chpwd")

# Source local scripts in `./.zsh_config` if present

function chpwd() {
  if [ -r $PWD/.zsh_config ]; then
    source $PWD/.zsh_config
  else
    source $HOME/.zshrc
  fi
}
