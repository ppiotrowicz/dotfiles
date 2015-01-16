#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias cls=clear
alias be="bundle exec"

source /Users/ppiotrowicz/codez/base/grid/extras/shell-completion/grid_completion.zsh

#/Users/ppiotrowicz/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
