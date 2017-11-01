#!/bin/sh

# links config files

# git
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore

# tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/tmux.styles.conf ~/.tmux.styles.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# ag
ln -s ~/dotfiles/agignore ~/.agignore

# gpg
mkdir ~/.gnupg
ln -s ~/dotfiles/gpg/gpg.conf ~/.gnupg/
ln -s ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/
