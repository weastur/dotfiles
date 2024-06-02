export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode disabled
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  docker
  git
  gitignore
  pip
  python
)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export VISUAL=vim
export GPG_TTY=$(tty)
export LESS='-SXFR'
export PATH=$PATH:$HOME/.local/bin
export SSH_AUTH_SOCK="/Users/weastur/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

