#!/bin/sh

ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux.styles.conf ~/.tmux.styles.conf
ln -s ~/dotfiles/agignore ~/.agignore

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir ~/.vim/swaps
mkdir ~/.vim/backups
