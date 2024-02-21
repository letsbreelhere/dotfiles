# CLI Colors (e.g. for `ls`)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LESS="--mouse --quit-if-one-screen --use-color --raw-control-chars"
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
export PATH="$PATH:$HOME/ifttt/dev-env/bin"
export PATH=".venv/bin:$PATH"

# env for cuda runs
export CUDA_DIR="/opt/cuda"
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
[ -f "/home/bree/.ghcup/env" ] && source "/home/bree/.ghcup/env" # ghcup-env
