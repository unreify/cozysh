# Configures the zsh completion system.

zstyle ':completion:*:*:*:*:*' menu select

# Case in-sensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Complete hidden (.) directories and files
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

