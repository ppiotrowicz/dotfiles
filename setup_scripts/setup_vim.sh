#!/bin/sh

# configures vim
# vim should be installed in setup_apps.sh

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/swaps
mkdir ~/.vim/backups

vim +PlugInstall +qall

