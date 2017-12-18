source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "denysdovhan/spaceship-zsh-theme", as:theme
zplug "djui/alias-tips"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# system custom
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# behaviour
export COMPLETION_WAITING_DOTS="true"
setopt auto_menu
setopt complete_in_word
setopt always_to_end
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_cd
setopt complete_aliases
setopt extended_glob
setopt correct
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history
setopt pushd_ignore_dups
setopt interactivecomments
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
REPORTTIME=1
TIMEFMT="%U user %S system %P cpu %*Es total"
unsetopt correctall
autoload -U colors && colors
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export EDITOR=vim

# plugin behaviour
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_SYMBOL=">"
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_PREFIX="| "
SPACESHIP_GIT_PREFIX="| "
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_NODE_SHOW=false
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# my aliases
alias l="ls -aFG"
alias ll="ls -ahlFG"
alias lll="ls -ahlFG | less"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ssh="ssh -A"
alias wget="wget -c"
alias external_ip="curl -s icanhazip.com"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us/"
alias ..="cd .."
alias ...="cd ../.."

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
