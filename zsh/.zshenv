# Brew path export(no idea why I need it, after running my zsh config it fucked up the PATH for some reason
export PATH="/opt/homebrew/bin:$HOME/bin:/Users/maorcohen/Library/Python/3.9/bin:$PATH"

# General config directory paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Zshell specific config directory paths
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath

export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Cuda architecture and compiler config
export CUDA_DOCKER_ARCH=6.1
export PATH="/usr/local/cuda/bin:/opt/nvim/:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64"

# Lua
export PATH="~/.luarocks/bin:$PATH"

# Default Mac clang don't work on Tinygrad
export PATH="/opt/homebrew/Cellar/llvm/19.1.7/bin:$PATH"
