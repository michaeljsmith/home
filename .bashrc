
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u \w]\$ '

#export EDITOR="emacsclient -t"
export EDITOR="vim"
export PATH=/home/msmith/bin:$PATH

# Git shortcuts.
alias gs="git status"
alias gl="git log"
alias gc="git add . && git commit -a"
