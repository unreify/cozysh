# Useful* alias definitions for ZSH.
# *to me, at least.
# 
# 
# This file is automatically sourced by cozysh on startup.
# 
# To execute in current shell:
#   `source aliases.zsh`


# Directories
alias l="ls"
alias c="clear"
alias ls="ls -a --color"

# Git
alias gst="git status"

# Virtual environments
alias venvs='ls $VENV_PATH'

alias lscolors="dircolors -b $ZSH/lib/LS_COLORS > $ZSH/lib/lscolors.zsh"

alias ipaddress="ip addr | grep -oe 'inet .*' | grep -v 127.0.0.1 | cut -d '/' -f 1 | cut -d ' ' -f 2"

# ZSH
alias zshrc="source $HOME/.zshrc"
