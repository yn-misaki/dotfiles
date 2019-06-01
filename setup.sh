#!/bin/bash

if [ ! -e ${HOME}/.vim/colors/ ]; then
  mkdir -p ~/.vim/colors
  cd /tmp
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
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
fi
