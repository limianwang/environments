

alias ll="ls -l";
alias cdm="cd ~/projects"
alias cdmx="cd ~/workspace"
alias n10start="nvm deactivate; nvm use 0.10.32"
alias n11start="nvm deactivate; nvm use 0.11.13"

export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='0;32'

# Exporting colors to the terminal
# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Reset the path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH";

# Parse the git branch of the folder
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

BLUE="\[\e[0;34m\]";
GREEN="\[\e[0;32m\]";
CYAN="\[\e[0;36m\]";
YELLOW="\[\e[0;33m\]";
RED="\[\e[0;31m\]";
NO_COLOUR="\[\e[m\]";

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

hash node 2>/dev/null || { n10start; }

if [ $ITERM_SESSION_ID ]; then
  unset PROMPT_COMMAND;
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

export PS1="$CYAN\u$NO_COLOUR:$YELLOW\W$NO_COLOUR $RED\$(parse_git_branch)$NO_COLOUR[$RED\j$NO_COLOUR]\n$ "
