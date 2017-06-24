autoload colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}✱'
zstyle ':vcs_info:*' unstagedstr '%F{red}✱'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' %c%u'
    } else {
        zstyle ':vcs_info:*' formats ' %c%u%F{yellow}✱'
    }

    vcs_info
}

setopt prompt_subst

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="${${KEYMAP/vicmd/❮}/(main|viins)/❯}"
    PROMPT='%F{white} λ %F{blue}%~${vcs_info_msg_0_/#% /}%F{blue} $VIM_PROMPT %{$reset_color%}'

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
