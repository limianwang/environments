
alias ll="ls -l";
alias cdm="cd ~/projects"
alias cdmx="cd ~/workspace"
alias node='node --harmony'
alias n10start="nvm deactivate; nvm use 0.10.33"
alias n11start="nvm deactivate; nvm use 0.11.14"
alias brewup='brew update && brew upgrade'
alias reload='source ~/.bashrc'

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
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_stash {
    [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}

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

hash node 2>/dev/null || { n11start; }

if [ $ITERM_SESSION_ID ]; then
  unset PROMPT_COMMAND;
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

export PS1="$CYAN\u$NO_COLOUR:$YELLOW\w$NO_COLOUR $RED\$(parse_git_branch)$NO_COLOUR[$RED\j$NO_COLOUR]\n$ "

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Go
export GOPATH=~/workspace/go
