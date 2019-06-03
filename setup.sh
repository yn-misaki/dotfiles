#!/bin/bash

##################
# 1. Set up Vim  #
##################

if [ ! -e ${HOME}/.vim/colors/ ]; then
  mkdir -p ~/.vim/colors
  git clone https://github.com/tomasr/molokai ~/.vim/colors/
fi

if [ ! -e ${HOME}/.vim/bundle/ ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf ~/dotfiles/_vimrc ~/.vimrc

vim +PluginInstall +qall

# Setup on Mac
if [ "$1" = "mac" ]; then
  if [ ! -e "/usr/local/bin/brew" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install tig
fi

sudo apt install tig

##################
# 2. Set up Git  #
##################

ln -sf ~/dotfiles/_gitconfig ~/.gitconfig

echo "Set up Git user information"
echo -n "Git User's name: "
read USER_NAME
git config --global user.name "${USER_NAME}"

echo -n "Git User's email: "
read USER_EMAIL
git config --global user.email "${USER_EMAIL}"
