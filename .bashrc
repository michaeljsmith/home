
# Check for an interactive session
[ -z "$PS1" ] && return

# Better bash history options
shopt -s histappend
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'

# Save history at each prompt
PROMPT_COMMAND='history -a'

# Set more generous bash history size.
HISTFILESIZE=10000
HISTSIZE=10000
alias ls='ls --color=auto'

. /etc/bash_completion

# Showing git branches in bash prompt
# Originally from
# http://nuts-and-bolts-of-cakephp.com/2010/11/27/show-git-branch-in-your-bash-prompt/
function parse_git_indicator {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:/'
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
PS1="\t [\[\033[01;32m\]\w\[\033[00m\]\$(parse_git_indicator)\[\033[00;33m\]\$(parse_git_branch)\[\033[00m\]]\$ "

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
alias gc="git commit"
complete -o default -o nospace -F _git_commit gc
alias gg="git add -A . && git commit -a"
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
alias gk="git cherry-pick"
complete -o default -o nospace -F _git_cherry_pick gk
alias gn="git clean"
complete -o default -o nospace -F _git_clean gn
