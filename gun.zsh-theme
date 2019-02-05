# Borrowing shamelessly from:
# https://github.com/gunkelolaf/dot-files/gun.zsh-theme


function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '>'
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'

source $HOME/.zplug/repos/robbyrussell/oh-my-zsh/plugins/kube-ps1/kube-ps1.plugin.zsh

PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}%{$reset_color%}
| $(kube-ps1)
╰─$(virtualenv_info)$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$FG[196]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FG[196]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
