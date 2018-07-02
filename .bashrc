# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-256color

export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin

source <(kubectl completion bash)

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/src/envs
source $HOME/.local/bin/virtualenvwrapper.sh

export VAGRANT_DEFAULT_PROVIDER=virtualbox
export VIEWER=vim

export ANSIBLE_NOCOWS=1

RESET=$(tput sgr0)

BLUE=$(tput setaf 4)
GREY=$(tput setaf 244)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "$YELLOW$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " ${RED}✗"
    fi
  fi
}

PS1='
$BLUE\w$(git_prompt)
$GREY$ $RESET'
