#!/bin/sh

# downloads and installs programming fonts

# Fira Mono font
echo "Installing Fira Mono"

mkdir ~/tmp/
cd ~/tmp
wget https://github.com/mozilla/Fira/raw/master/otf/FiraMono-Regular.otf
cp FiraMono-Regular.otf ~/Library/Fonts/
rm -rf ~/tmp/

# M+ font
echo "Installing M+ 1m"

mkdir ~/tmp/
cd ~/tmp
wget https://www.fontsquirrel.com/fonts/download/M-1m -O M-1m.zip
unzip M-1m.zip
cp mplus-1m-*.ttf ~/Library/Fonts/
rm -rf ~/tmp/

# Input Mono fonts
echo "Installing Input Mono Condensed"

mkdir ~/tmp/
cd ~/tmp
wget "http://input.fontbureau.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=" -O input.zip
unzip input.zip
cp Input_Fonts/InputMono/InputMonoCondensed/InputMonoCondensed-*.ttf ~/Library/Fonts
rm -rf ~/tmp/
