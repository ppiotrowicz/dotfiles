#!/bin/sh

# configure emacs
# app should be installed as part of setup_apps.sh

git clone git@github.com:ppiotrowicz/emacs.d ~/.emacs.d
cd ~/.emacs.d
git submodule init
git submodule update

# TODO: cask has dependency on "regular" emacs from brew
cask install

# TODO run M-x all-the-icons-install-fonts
