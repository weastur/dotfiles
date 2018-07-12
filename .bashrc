# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin

source <(kubectl completion bash)

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/src/envs
source $HOME/.local/bin/virtualenvwrapper.sh

export VAGRANT_DEFAULT_PROVIDER=virtualbox
export VIEWER=vim

export ANSIBLE_NOCOWS=1
