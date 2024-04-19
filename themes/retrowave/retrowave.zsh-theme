GREEN="%{$FG[084]%}"
PINK="%{$FG[013]%}"
YELLOW="%{$FG[227]%}"
INDIGO="%{$FG[021]%}"
PURPLE="%{$FG[057]%}"
AQUA="%{$FG[014]%}"
LIGHTBLUE="%{$FG[045]%}"
BLUE="%{$FG[039]%}"
ORANGE="%{$FG[203]%}"
ORANGEYELLOW="%{$FG[215]%}"
YELLOWGREEN="%{$FG[154]%}"
REDPINK="%{$FG[162]%}"
GIT_START="git:("
GIT_END=")"

function git_info() {
    if [[ -n "$(git_branch)" ]]; then
        echo "$PINK$GIT_START$INDIGO%B$(git_branch)%b$PINK$GIT_END"
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

function venv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        VENV_NAME=$(echo "$VIRTUAL_ENV" | sed 's:.*/::')
        echo $REDPINK "("$YELLOW$VENV_NAME$REDPINK")"
    fi
}


DEFAULT_USER="$(whoami)"
function machine_info() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
        echo "$YELLOW$USER$ORANGE@$ORANGEYELLOW$HOST"
    fi
}
CUR_DIR="%c"
PROMPT='$(machine_info)$(venv_info) $GREEN➜ %B$AQUA$CUR_DIR%b%{$reset_color%} $(git_info) %{$reset_color%}'

