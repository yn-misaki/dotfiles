#!/bin/bash

if [ ! -e "~/.vim" -a ! -e "/tmp/molokai" ]; then
  mkdir -p ~/.vim/colors
  cd /tmp
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
fi

ln -sf ~/dotfiles/_vimrc ~/.vimrc
