
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u \w]\$ '

export EDITOR="emacsclient -t"
export PATH=/home/msmith/bin:$PATH
