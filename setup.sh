#!/bin/bash

if [ ! -e "~/.vim" ]; then
  mkdir -p ~/.vim/colors
  cd /tmp
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
fi

if [ ! -e "~/.vim/bundle" ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

ln -sf ~/dotfiles/_vimrc ~/.vimrc
