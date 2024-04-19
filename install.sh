#!/usr/bin/env sh


################################################################################
# Install script for cozysh.                                                   #
# http://github.com/unreify/cozysh                                             #
#                                                                              #
# Requirements:                                                                #
# - zsh                                                                        #
# - git                                                                        #
# - coreutils (for LSCOLORS themes)                                            #
#                                                                              #
# - Clone cozysh repository to `$HOME/.cozysh`, or `$ZDOTDIR/.cozysh` if       #
# `$ZDOTDIR` configured.                                                       #
# - Create .zshrc if not exist and sources cozysh.                             #
# - Switch default shell to zsh.                                               #
################################################################################


# Get configured ZDOTDIR or default to home.
ZDIR="${ZDOTDIR:-$HOME}"

clone_git() {
    echo "=> git cloning cozysh into $ZDIR/.cozysh"

    if [[ -d "$ZDIR/.cozysh" ]]; then
        echo "$ZDIR/.cozysh directory already exists. Skipping git clone."
    else
        git clone https://github.com/unreify/cozysh.git $ZDIR/.cozysh
    fi
}

setup_cozysh() {
    echo "=> Configuring cozysh"

    if [[ -f "$ZDIR/.zshrc" || -h "$ZDIR/.zshrc" ]]; then
        echo "Found existing .zshrc file: "$ZDIR/.zshrc
    else
        echo "Creating .zshrc file"
        touch $ZDIR/.zshrc
    fi
    
    echo "source $ZDIR/.cozysh/zshrc" >> $ZDIR/.zshrc
}

check_dependencies() {
    if ! command -v git &> /dev/null; then
        echo "Error: git could not be found. Is it installed?"
        exit 1
    fi

    if ! command -v zsh &> /dev/null; then
        echo "Error: zsh could not be found. Is it installed?"
        exit 1
    fi

    if ! command -v coreutils &> /dev/null; then
        echo "Error: coreutils could not be found. cozysh uses dircolors to style `ls` colors. Please install coreutils for your distribution."
        exit 1
    fi
}

change_shell() {
    echo "=> Checking default shell"
    case $SHELL in
    */zsh) 
        echo "zsh"
        ;;
    *)
        echo "Detected current shell as: "$(basename "$SHELL") 
	    echo "Changing default shell to zsh"
        chsh -s $(which zsh)
    esac
}

check_dependencies
clone_git
setup_cozysh
change_shell

echo "=> cozysh installed. Please logout and log back in."
