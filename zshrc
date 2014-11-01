ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"

plugins=(git hub z brew rails ppiotrowicz)

export PATH="/usr/local/bin:$PATH"
export EDITOR=vim

alias todo="vim ~/current.todo"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $ZSH/oh-my-zsh.sh
