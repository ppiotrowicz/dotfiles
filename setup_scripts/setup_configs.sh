#!/bin/sh

# links config files

# git
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore

# zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# ag
ln -s ~/dotfiles/agignore ~/.agignore

# gpg
mkdir ~/.gnupg
ln -s ~/dotfiles/gpg/gpg.conf ~/.gnupg/
ln -s ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/
