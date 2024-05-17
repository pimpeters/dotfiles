# curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
source ~/.bash_git

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export KEYTIMEOUT=1
export EDITOR=vim
export GIT_EDITOR=vim

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

PROMPT_COMMAND='__git_ps1 "\[\e[34m\]\w\[\e[0m\]" "\[\e[35m\] | \[\e[0m\]"'

# include .bashrc.local if it exists
if [ -f $HOME/.bashrc.local ]; then
    . $HOME/.bashrc.local
fi
