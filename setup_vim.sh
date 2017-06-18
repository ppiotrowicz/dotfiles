#!/bin/sh

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/swaps
mkdir ~/.vim/backups

vim +PlugInstall +qall

