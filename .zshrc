export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode disabled
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(
  docker
  docker-compose
  gh
  git
  git-auto-fetch
  git-lfs
  gitignore
  tmux
  tmuxinator
)

source $ZSH/oh-my-zsh.sh

alias mux=tmuxinator

export EDITOR=vim
export VISUAL=vim
export LESS='-SXFR'
