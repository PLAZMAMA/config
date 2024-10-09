# Brew path export(no idea why I need it, after running my zsh config it fucked up the PATH for some reason
export PATH="/opt/homebrew/bin:$PATH"

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
