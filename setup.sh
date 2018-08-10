#!/bin/bash

if [ ! -e "~/.vim" ]; then
  mkdir -p ~/.vim/colors
  cd /tmp
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
fi

ln -sf ~/dotfiles/_vimrc ~/.vimrc

if [ ! -e "/usr/local/bin/brew" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

