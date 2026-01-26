# Ensure git-prompt.sh is downloaded
[ -f ~/.git_prompt.sh ] || curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git_prompt.sh

source ~/.git_prompt.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export KEYTIMEOUT=1
export EDITOR=vim
export GIT_EDITOR=vim

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

PS1='\[\e[34m\]\w\[\e[0m\]$(__git_ps1 " (\[\e[32m\]%s\[\e[0m\])")\[\e[35m\] | \[\e[0m\]'

# Include .bashrc.local if it exists
[ -f "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"
