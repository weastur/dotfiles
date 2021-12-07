# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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
shopt -s checkwinsize
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export EDITOR=vim
export ANSIBLE_NOCOWS=1
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
export GPG_TTY=$(tty)

export BORG_RSH='ssh -i <<PATH TO SERVER KEY>>'
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK='yes'
export BORG_RELOCATED_REPO_ACCESS_IS_OK='yes'

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

source <(gh completion -s bash)

# >>>> Vagrant command completion (start)
. /opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)
