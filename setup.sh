#!/usr/bin/env bash

# Ensure latest Homebrew is used
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install Homebrew Caskroom
brew install caskroom/cask/brew-cask
brew cask install iterm2
brew cask install virtualbox

brew install bash
brew install vim

brew install docker-machine
brew install docker
brew install ack
brew install git
brew install git-extras
brew install go
brew install nvm
brew install redis
brew install mongodb
brew install mysql

brew cask cleanup

# Remove outdated versions from the cellar.
brew cleanup -s

# Atom packages
pkgs=(
"atom-beautify"
"atom-material-ui"
"atom-terminal"
"atom-ternjs"
"autocomplete-go"
"builder-go"
"base16-ocean-dark-syntax"
"docblockr"
"editorconfig"
"file-icons"
"gingerbread-syntax"
"git-plus"
"go-config"
"go-get"
"go-plus"
"gofmt"
"gometalinter-linter"
"gorename"
"hybrid-next-syntax"
"language-docker"
"language-jade"
"language-terraform"
"react"
"seti-syntax"
"seti-ui"
"tester-go"
"todo-show"
"vim-mode"
)

for i in "${pkgs[@]}"
do
	apm install $i
done
