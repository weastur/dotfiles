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
  direnv
  fd
  fzf
  gh
  git
  git-lfs
  httpie
  nmap
  podman
  poetry
  pre-commit
  python
  ripgrep
  rsync
  rust
  ssh-agent
  tmux
  tmuxinator
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias bathelp='bat --plain --language=help'
alias cat='bat -p -P'
alias https='http --default-scheme=https'
alias l='exa -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='exa'
alias lt="l -T -L 2"
alias ipython=ipython3
alias mc='mc --nosubshell'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export EDITOR=vim
export VISUAL=vim
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'
export GPG_TTY=$(tty)
export HOMEBREW_BAT=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export LESSOPEN="| /opt/homebrew/bin/src-hilite-lesspipe.sh %s"
export LESS='-SXFR'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$PATH:$HOME/.local/bin
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export CONTAINERS_MACHINE_PROVIDER=applehv

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

function httpless {
  http --pretty=all --print=hb "$@" | less -R;
}

batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

help() {
  "$@" --help 2>&1 | bathelp
}
