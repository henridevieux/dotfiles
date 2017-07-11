# hdevieux
# .bashrc
# This file is managed by dotfiles repository
# Last updated: 3/22/2017

# Source external functions
test -f "${HOME}"/.bash_functions && source "${HOME}"/.bash_functions
test -f "${HOME}"/.bash_aliases && source "${HOME}"/.bash_aliases

# Color definitions
GREEN="\[\033[1;32m\]"
RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
RESET="\[\033[0m\]"

# This may be changed in local machine configuration
PROMPT_COLOR=${GREEN}
export PS1="[${PROMPT_COLOR}\h${RESET}]:\u:\w${YELLOW}\$(git_branch_info)${RESET} \n$ "

# Terminal colors
export CLICOLOR=1
if [ "$(uname)" == 'Darwin' ]; then
    export LSCOLORS=GxFxCxDxBxegedabagaced
elif [ "$(uname)" == 'Linux' ]; then
    export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
    alias ls='ls --color=always'
fi

export EDITOR=/usr/bin/vim

export PATH=/Users/hdevieux/bin:/usr/local/bin:/usr/local/sbin:$PATH

if [ "$(uname)" == 'Darwin' ]; then
    export PATH=$(brew --prefix)/sbin:$(brew --prefix)/bin:$PATH:$HOME/bin
fi

# GO PATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

# Rust Path
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# Disable sounds
bind "set bell-style none"

# Treat cases equal for autocomplete
bind "set completion-map-case on"
bind "set completion-ignore-case on"

# Append to history
shopt -s histappend
shopt -s cmdhist

# Machine-local configurations. These override previous settings
test -f "${HOME}"/.bash_local && source "${HOME}"/.bash_local
