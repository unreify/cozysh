# cozysh

Cozy ZSH configs

## Installation

### Pre-requisites
- `zsh`
- `git` (to install)
- `coreutils` (for LSCOLORS theming)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/unreify/cozysh/refs/heads/master/install.sh)"`

### Install
- Download the repo, preferably to `$HOME`. 
- Create a `.zshrc` in `$HOME` (or `$ZDOTDIR` if using) if it doesn't already exist. 
- At the top of `$HOME/.zshrc`, source the base `zshrc` file in the downloaded repo's root directory:

```
source $HOME/cozysh/zshrc
```
