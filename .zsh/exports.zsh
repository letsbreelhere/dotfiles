# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR=cursor

# Paths
export PATH="$HOME/.local/bin:$PATH"
# Add npm bins to path if they're available
if [[ ! `type npm > /dev/null` ]]; then;
  export PATH="$(npm bin -g 2>/dev/null):$PATH"
  export PATH="$(npm bin):$PATH"
fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH" # Python symlinks
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/dev-env/bin:$PATH"
export PATH="$HOME/dev/jenkins-shared-libraries/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PWD/.local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=".venv/bin:$PATH"
export DISABLE_LANDRUSH=1

export PATH="$PWD/bin:$PATH"

export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Work

export ACADEMIA_LDAP_USERNAME="breegardner"
export ACADEMIA_SSH_KEY="$HOME/.ssh/id_rsa"
export ACADEMIA_ROOT="$HOME/academia"
export ACADEMIA_APP="$HOME/academia/academia-app"
export ACADEMIA_CONFIG="$HOME/academia/academia-config"
export ACADEMIA_SHELL="$HOME/.academia-shell"
export ACADEMIA_ZOO="$HOME/academia-zoo"

export FORWARD_AWS_CREDENTIALS="true"
