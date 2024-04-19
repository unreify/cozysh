# Autocomplete
autoload -U compinit
compinit -d $HOME/.cache/zsh/zcompdump

for zsh_config ($ZSH/lib/*.zsh); do
    source $zsh_config
done

# Source the theme
# If ZSH_THEME is not set, default to "dracula".
local THEME_PATH="$ZSH/themes/${ZSH_THEME:=dracula}"
source "$THEME_PATH/$ZSH_THEME.zsh-theme"

# Source theme colors for ls colors or default if not set for theme.
local LSCOLORS="$ZSH/lib/LS_COLORS"
if [[ -f "$THEME_PATH/LS_COLORS" ]]; then
	LSCOLORS="$THEME_PATH/LS_COLORS"
fi
source <(dircolors -b $LSCOLORS)

