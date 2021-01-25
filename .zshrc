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
export GOPATH=/usr/local/go
export EDITOR=vim
export ANSIBLE_NOCOWS=1
export VAGRANT_EXPERIMENTAL="disks"
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin:$GOROOT/bin:/home/weastur/.local/share/dephell/venvs/dephell/bin:$GEM_HOME/bin
export GPG_TTY=$(tty)


source "/home/weastur/.local/share/dephell/_dephell_zsh_autocomplete"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/weastur/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.poetry/bin:$PATH"
