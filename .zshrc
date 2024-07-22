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
  brew
  git
  git-lfs
  podman
  python
)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export VISUAL=vim
export LESS='-SXFR'
export PATH=$PATH:$HOME/.local/bin
export PYTHONDONTWRITEBYTECODE=1

alias docker=podman
alias grep='grep --color=auto --binary-files=without-match --exclude-dir=.git'
alias ggrep='grep -irn -C 3'
