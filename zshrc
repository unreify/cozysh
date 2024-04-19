# When sourced, resolves to the directory this script lives in.
ZSH="${${(%):-%x}:a:h}"
export ZSH

# Configure theme.
export ZSH_THEME="retrowave"

# Source cozysh.
source $ZSH/zsh.sh

# Configure save history.
setopt appendhistory
setopt SHARE_HISTORY
HISTFILE=${XDG_DATA_HOME/zsh:-$HOME}/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


