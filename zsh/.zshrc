


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
alias glo='git log --pretty="online"'

# Ls
alias ls='ls --color=auto'
alias lsa='ls -lahF'

# Neovim
alias vim='nvim'
alias vi='nvim'

# Folders
alias conf='$XDG_CONFIG_HOME'
alias src='$HOME/src'


#################
# Auto Completion
#autoload -U compinit
#compinit
#_comp_options+=(globdots) # Adds hidden files completion  

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
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

PROMPT='⎇ ${vcs_info_msg_0_} %2~%(?.%F{82}=>.%F{124}=>)%f '