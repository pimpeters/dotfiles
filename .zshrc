#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# Customize to your needs...
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

export KEYTIMEOUT=1
export EDITOR=vim
export GIT_EDITOR=vim
