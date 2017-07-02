#!/bin/sh

# sets up brew with brew bundle and installs all apps

# install brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew bundle
brew tap Homebrew/bundle

# install apps from Brewfile 
brew bundle
