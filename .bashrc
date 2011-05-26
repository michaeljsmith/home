
# Check for an interactive session
[ -z "$PS1" ] && return


# Set more generous bash history size.
export HISTSIZE=5000
alias ls='ls --color=auto'
PS1='[\u \w]\$ '

. /etc/bash_completion

#export EDITOR="emacsclient -t"
export EDITOR="vim"
export PATH=/home/msmith/bin:$PATH

# Git shortcuts.
alias go="git checkout"
complete -o default -o nospace -F _git_checkout go
alias gr="git rebase"
complete -o default -o nospace -F _git_rebase gr
alias gi="git rebase -i"
complete -o default -o nospace -F _git_rebase gi
alias gs="git status"
alias gl="git log"
complete -o default -o nospace -F _git_log gl
alias gd="git diff"
complete -o default -o nospace -F _git_diff gd
alias gh="git show"
complete -o default -o nospace -F _git_show gh
alias gc="git commit -a"
complete -o default -o nospace -F _git_commit gc
alias gg="git add . && git commit -a"
complete -o default -o nospace -F _git_commit gg
alias ge="git reset"
complete -o default -o nospace -F _git_reset ge
alias gb="git branch"
complete -o default -o nospace -F _git_branch gb
alias gp="git push"
complete -o default -o nospace -F _git_push gp
alias gu="git pull --rebase"
complete -o default -o nospace -F _git_pull gu
alias ga="git add"
complete -o default -o nospace -F _git_add ga
alias gm="git rm"
complete -o default -o nospace -F _git_rm gm
alias gt="git stash"
complete -o default -o nospace -F _git_stash gt
