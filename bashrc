#
# Hdevieux .bashrc
#

# Source external functions
test -f "${HOME}"/.bash_functions && source "${HOME}"/.bash_functions
test -f "${HOME}"/.bash_aliases && source "${HOME}"/.bash_aliases

# Color definitions
GREEN="\[\033[1;32m\]"
RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
RESET="\[\033[0m\]"

# Work environments will set prompt color based on prod/non-prod
PROMPT_COLOR=$GREEN

export PS1="[${PROMPT_COLOR}\h${RESET}]:\u:\w${YELLOW}\$(git_branch_info)${RESET} \n$ "

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


export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"
