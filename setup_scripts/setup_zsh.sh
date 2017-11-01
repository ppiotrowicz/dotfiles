#!/bin/sh

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

shell_path="$(which zsh)"

if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    sudo sh -c "echo $shell_path >> /etc/shells"
fi
sudo chsh -s "$shell_path" "$USER"
