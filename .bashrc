# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"

HISTTIMEFORMAT="%F %T "
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
HISTSIZE=10000
HISTFILESIZE=2000000
HISTCONTROL=ignoreboth
shopt -s autocd
shopt -s cdspell
shopt -s direxpand dirspell
shopt -s globstar
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export WORKON_HOME=$HOME/src/envs
export GOPATH=$HOME/src/golang
export EDITOR=vim
export ANSIBLE_NOCOWS=1
export VAGRANT_EXPERIMENTAL="disks"
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
export GPG_TTY=$(tty)

export BORG_RSH='ssh -i <<PATH TO SERVER KEY>>'
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK='yes'
export BORG_RELOCATED_REPO_ACCESS_IS_OK='yes'


# added by travis gem
[ ! -s /home/weastur/.travis/travis.sh ] || source /home/weastur/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias travis=/home/weastur/.rvm/gems/ruby-3.0.0@travis-cli/wrappers/travis
