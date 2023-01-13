#!/bin/bash

##################
# 1. Set up Vim  #
##################

if [ ! -e ${HOME}/.vim/colors/ ]; then
  mkdir -p ~/.vim/colors
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
  rm -rf molokai
fi

if [ ! -e ${HOME}/.vim/bundle/ ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf ~/.dotfiles/_vimrc ~/.vimrc

vim +PluginInstall +qall

# Setup on Mac
if [ "$1" = "mac" ]; then
  if [ ! -e "/usr/local/bin/brew" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install tig
else
  sudo apt install tig
fi

##################
# 2. Set up Git  #
##################
configure_user() {
  echo "Git user information"
  echo -n "Git User's name: "
  read USER_NAME
  git config --global user.name "${USER_NAME}"

  echo -n "Git User's email: "
  read USER_EMAIL
  git config --global user.email "${USER_EMAIL}"
}

if [ ! -e ${HOME}/.gitconfig ]; then
  cp -p ~/dotfiles/_gitconfig ~/.gitconfig
  configure_user
  git config --global url."git@github.com:".insteadOf https://github.com
  git config --global grep.lineNumber true
else
  while true; do
    read -p "overwrite '~/.gitconfig'? [y/n]: " ANSWER
    case $ANSWER in
        [Yy]* )
          cp -p ~/dotfiles/_gitconfig ~/.gitconfig
          configure_user
          break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
fi
