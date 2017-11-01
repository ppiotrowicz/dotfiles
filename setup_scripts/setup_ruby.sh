#!/bin/sh

ln -s ~/dotfiles/ruby/gemrc ~/.gemrc
ln -s ~/dotfiles/ruby/irbrc ~/.irbrc
ln -s ~/dotfiles/ruby/pryrc ~/.pryrc

RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline --with-openssl-dir=/usr/local/opt/openssl" rbenv install 2.4.2
