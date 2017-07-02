#!/bin/sh

# runs all setup scripts

cd ~/dotfiles/setup_scripts/

./setup_configs.sh
./setup_apps.sh
./setup_fonts.sh
./setup_emacs.sh
./setup_vim.sh
./setup_rubies.sh
./setup_osx.sh

cd ~
