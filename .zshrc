export ZSH=/home/amelius/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git fabric docker encode64 pip python redis-cli tmux web-search vagrant)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

LS_COLORS="di=01;34"
export LS_COLORS

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin

source <(kubectl completion zsh)

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/src/envs
source $HOME/.local/bin/virtualenvwrapper.sh

export VAGRANT_DEFAULT_PROVIDER=virtualbox
export VIEWER=vim

export ANSIBLE_NOCOWS=1
