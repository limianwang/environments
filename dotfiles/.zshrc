#!/usr/bin/env zsh

setopt prompt_subst

export ZSH="/Users/$USER/.oh-my-zsh"
export EDITOR=vim
export VISUAL=vim
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

plugins=(
	git
)

test -f $ZSH/oh-my-zsh.sh && . $_

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -i
fi

# Exporting colors to the terminal
# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Reset the path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH";

# Parse the git branch of the folder
function parse_git_branch_and_stash() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    local dirty=$(git diff --quiet 2>/dev/null || echo "*")
    local stash=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
    echo "($branch$dirty | stash:$stash) "
  fi
}
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty)$(parse_git_stash)) /"
}

function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_stash {
    local count=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
    [[ $count -gt 0 ]] && echo "^"
}

function list_deps {
    brew list | while read cask; do echo -n "$cask ->"; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
}

alias deps=list_deps

# http://apple.stackexchange.com/questions/55875/git-auto-complete-for-branches-at-the-command-line
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
test -f ~/.git-completion.bash && . $_

BLUE="\[\e[0;34m\]";
GREEN="\[\e[0;32m\]";
CYAN="\[\e[0;36m\]";
YELLOW="\[\e[0;33m\]";
RED="\[\e[0;31m\]";
NO_COLOUR="\[\e[m\]";

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix nvm)/etc/bash_completion.d/nvm

function initNode()  {
	nvm use default;
}
initNode

precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

if [ $ITERM_SESSION_ID ]; then
   precmd
fi

export PROMPT='%10F{blue}%n%f@%F{blue}%m:%f%F{yellow}%~%f %F{red}$(parse_git_branch_and_stash)%f(%F{red}%(1j.%j.0)%f)'$'\n''λ %F{yellow}=>%f '

# Postgres
alias pg='postgres'
export PGDATA=/usr/local/var/postgres/

#pyenv
export PATH=$(pyenv root)/shims:$PATH
# setup pyenv environment
if type pyenv &>/dev/null; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv virtualenv-init -)"
fi

# Go
export GOPATH=~/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Flutter
export PATH="$PATH:/Users/$USER/flutter/bin"

# aliases
alias ll="ls -l";
alias cdm="cd ~/dev"
alias cdg="cd $GOPATH/src"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
