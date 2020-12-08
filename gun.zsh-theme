# Borrowing shamelessly from:
# https://github.com/gunkelolaf/dot-files/gun.zsh-theme


function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '🐍'`basename $VIRTUAL_ENV`
}

function prompt_char {
    echo '>'
}

local current_user='%{$FG[040]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$FG[226]%}${PWD/#$HOME/~}%{$reset_color%}'
local git_info='$(git_prompt_info)'
local kubePrompt='$(kube_ps1)' # to show add ${kubePrompt} in $PROMPT
local virtualenv_info_var='$(virtualenv_info)'

PROMPT="${current_user} ${current_dir}${git_info} %{$FG[239]%}${virtualenv_info_var}%{$reset_color%}
$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$FG[196]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FG[196]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
