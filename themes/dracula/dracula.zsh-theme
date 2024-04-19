# The dracula color theme
# https://draculatheme.com/contribute#color-palette

DARKGRAY="%{$FG[059]%}"
GRAY="%{$FG[060]%}"
WHITE="%{$FG[231]%}"
BLUEGRAY="%{$FG[103]%}"
CYAN="%{$FG[159]%}"
GREEN="%{$FG[120]%}"
ORANGE="%{$FG[222]%}"
PINK="%{$FG[212]%}"
PURPLE="%{$FG[183]%}"
RED="%{$FG[210]%}"
YELLOW="%{$FG[229]%}"

BLUEPURPLE="%{$FG[063]%}"

GIT_START="git:("
GIT_END=")"

function git_info() {
    if [[ -n "$(git_branch)" ]]; then
        echo "$PINK$GIT_START$CYAN%B$(git_branch)%b$PINK$GIT_END"
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

function venv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        VENV_NAME=$(echo "$VIRTUAL_ENV" | sed 's:.*/::')
        echo $PINK "("$YELLOW$VENV_NAME$PINK")"
    fi
}


DEFAULT_USER="$(whoami)"
function machine_info() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
        echo "$YELLOW$USER$ORANGE@$ORANGEYELLOW$HOST"
    fi
}
CUR_DIR="%c"
PROMPT='$(machine_info)$(venv_info) $GREEN➜ %B$BLUEPURPLE$CUR_DIR%b%{$reset_color%} $(git_info) %{$reset_color%}'

