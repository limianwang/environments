#!/bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
brew bundle --file=./Brewfile

cp ./dotfiles/.zshrc ~/.zshrc

# setup vim by copying the vimrc file
mkdir -p ~/.vim && \
  rm -rf ~/.vim/bundle/Vundle.vim && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  curl https://raw.githubusercontent.com/limianwang/environments/master/dotfiles/.vimrc --output ~/.vimrc && \
  vim -E +PluginInstall +qall > /dev/null
