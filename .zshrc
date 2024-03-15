export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode disabled
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(
  podman
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export VISUAL=vim
export LESS='-SXFR'

alias wtools='podman run --rm -v "$(pwd)":/wdir --net=host -ti wtools bash'
