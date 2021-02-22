export ZSH="/home/weastur/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  kubectl
  ansible
  docker
  fabric
  git
  pip
  tmux
  pipenv
  django
  vagrant
  vscode
  terraform
  ssh-agent
  rsync
  sudo
)

source $ZSH/oh-my-zsh.sh

export WORKON_HOME=$HOME/src/envs
export GOPATH=$HOME/src/golang
export EDITOR=vim
export ANSIBLE_NOCOWS=1
export VAGRANT_EXPERIMENTAL="disks"
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
export GPG_TTY=$(tty)

