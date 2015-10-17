#!/usr/bin/env bash

# Ensure latest Homebrew is used
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install bash
brew install vim

brew install ack
brew install git
brew install git-extras
brew install go
brew install nvm
brew install redis
brew install mongodb
brew install mysql

# Install Homebrew Caskroom
brew install caskroom/cask/brew-cask
brew cask install iterm2
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup -s
