export ZSH=/home/amelius/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git fabric docker encode64 pip python redis-cli tmux web-search vagrant)

source $ZSH/oh-my-zsh.sh

alias kdd="kubectl --context dev"
alias kdc="kubectl --context dev --namespace cassandra-test"
alias kdi="kubectl --context dev --namespace infra"
alias kdb="kubectl --context dev --namespace backend"
alias kdv="kubectl --context dev --namespace va"
alias kds="kubectl --context dev --namespace spark-test"
alias kdf="kubectl --context dev --namespace kafka-test"

alias kmd="kubectl --context minikube"

alias kvd="kubectl --insecure-skip-tls-verify=true --context vg"
alias kvc="kubectl --insecure-skip-tls-verify=true --context vg --namespace cassandra-test"
alias kvi="kubectl --insecure-skip-tls-verify=true --context vg --namespace infra"
alias kvb="kubectl --insecure-skip-tls-verify=true --context vg --namespace backend"
alias kvv="kubectl --insecure-skip-tls-verify=true --context vg --namespace va"
alias kvs="kubectl --insecure-skip-tls-verify=true --context vg --namespace spark-test"
alias kvf="kubectl --insecure-skip-tls-verify=true --context vg --namespace kafka-test"

alias kpd="kubectl --insecure-skip-tls-verify=true --context vp"
alias kpc="kubectl --insecure-skip-tls-verify=true --context vp --namespace cassandra-test"
alias kpi="kubectl --insecure-skip-tls-verify=true --context vp --namespace infra"
alias kpb="kubectl --insecure-skip-tls-verify=true --context vp --namespace backend"
alias kpv="kubectl --insecure-skip-tls-verify=true --context vp --namespace va"
alias kpf="kubectl --insecure-skip-tls-verify=true --context vp --namespace kafka-test"
alias kps="kubectl --insecure-skip-tls-verify=true --context vp --namespace spark-test"

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
