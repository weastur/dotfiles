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
  brew
  gh
  git
  git-lfs
  gitignore
  golang
  nmap
  pip
  python
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
 FPATH=$HOME/.zfunc:$(brew --prefix)/share/zsh-completions:$FPATH

 autoload -Uz compinit
 compinit
fi

alias ipython=ipython3

export EDITOR=vim
export GPG_TTY=$(tty)
export LESS='-SXFR'
export PATH=$HOME/.local/bin:$PATH
