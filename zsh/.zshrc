#########
# Aliases

# Git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias glo='git log --pretty="oneline"'
alias gllo='git log --pretty="oneline" @{push}..'

# Ls
alias ls='ls --color=auto'
alias lsa='ls -lahF'

# Neovim
alias vim='nvim'
alias vi='nvim'

# Folders
alias conf='cd $XDG_CONFIG_HOME'
alias src='cd $HOME/src'
alias wiki='cd $HOME/Documents/plazmama.github.io/'

# Brew
alias brewup='brew update && brew upgrade && brew cleanup'
alias brew="arch --arm64 brew"

#################
# Auto Completion
autoload -U compinit
compinit -u
_comp_options+=(globdots) # Adds hidden files completion  

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#################
# Directory Stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9})
do
    alias "$index"="cd +${index}"
    unset index
done

##############
# Shell prompt

# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'

# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'

##############
# Lua settings
eval $(luarocks path --no-bin)

# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

PROMPT='⎇ ${vcs_info_msg_0_} %~%(?.%F{82}=>.%F{124}=>)%f '

##########
# Vim mode
bindkey -v
export KEYTIMEOUT=1 # Makes the switch between modes quicker

# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
cursor_block='\e[2 q'
cursor_beam='\e[6 q'

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne $cursor_block
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne $cursor_beam
    fi
}

zle-line-init() {
    echo -ne $cursor_beam
}

zle -N zle-keymap-select
zle -N zle-line-init

