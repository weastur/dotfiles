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
)

source $ZSH/oh-my-zsh.sh
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export WORKON_HOME=$HOME/src/envs
export GOPATH=$HOME/src/golang
export EDITOR=vim
export ANSIBLE_NOCOWS=1
export VAGRANT_EXPERIMENTAL="disks"
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
export GPG_TTY=$(tty)

