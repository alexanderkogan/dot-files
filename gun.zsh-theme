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
local kubePrompt='$(kube_ps1)'

PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}%{$reset_color%}
| ${kubePrompt}
╰─$(virtualenv_info)$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$FG[196]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FG[196]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
