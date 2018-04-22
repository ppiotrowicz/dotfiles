autoload colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}✱'
zstyle ':vcs_info:*' unstagedstr '%F{red}✱'
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git

precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' %F{green}%b %c%u%f'
    } else {
        zstyle ':vcs_info:*' formats ' %F{green}%b %c%u%F{yellow}*%f'
    }

    vcs_info
}

setopt prompt_subst

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/||}/(main|viins)/::}"
    PROMPT='%{$fg[red]%} PP %{$fg[blue]%}$VIM_PROMPT %{$fg[blue]%}%~${vcs_info_msg_0_/#% /}%{$fg[blue]%}>%{$reset_color%} '

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
