#!/usr/bin/env bash

export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

# Exporting colors to the terminal
# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Reset the path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH";

# Parse the git branch of the folder
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty)$(parse_git_stash)) /"
}

function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_stash {
    [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
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

hash node 2>/dev/null || { nvm use 8; }

if [ $ITERM_SESSION_ID ]; then
  unset PROMPT_COMMAND;
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

#export PS1="$CYAN\u$NO_COLOUR:$YELLOW\w$NO_COLOUR $RED\$(parse_git_branch)$NO_COLOUR[$RED\j$NO_COLOUR]$YELLOW\n⚡$NO_COLOUR "
export PS1="$CYAN\u$NO_COLOUR@$BLUE\h$NO_COLOUR:$YELLOW\w$NO_COLOUR $RED\$(parse_git_branch)$NO_COLOUR($RED\j$NO_COLOUR)\nλ $YELLOW=>$NO_COLOUR "

# Docker (boot2docker)
#
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# Docker commands
# eval $(docker-machine env)
# docker rmi -f $(docker images -f "dangling=true" -q)
alias dc='docker-compose'
alias dm='docker-machine'

# Postgres
alias pg='postgres'
export PGDATA=/usr/local/var/postgres/

# Go
export GOPATH=~/dev/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# pyenv
export PATH=$(pyenv root)/shims:$PATH

# aliases
alias ll="ls -l";
alias cdm="cd ~/dev"
alias cdg="cd $GOPATH/src"
alias brewup='brew update && brew upgrade'
alias reload='source ~/.bashrc'
