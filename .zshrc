export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode disabled
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  aws
  brew
  git
  git-lfs
  gitignore
  kubectl
  minikube
  pip
  podman
  python
  terraform
  vault
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias ipython=ipython3

export EDITOR=vim
export VISUAL=vim
export GPG_TTY=$(tty)
export LESS='-SXFR'
export PATH=$PATH:$HOME/.local/bin
export SSH_AUTH_SOCK="/Users/weastur/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
