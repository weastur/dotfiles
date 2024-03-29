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
  1password
  adb
  aliases
  ansible
  ant
  argocd
  aws
  brew
  composer
  direnv
  fd
  fzf
  gh
  git
  git-lfs
  gitignore
  golang
  gpg-agent
  helm
  httpie
  iterm2
  kubectl
  nmap
  nmap
  pass
  pip
  podman
  poetry
  postgres
  pre-commit
  python
  rbenv
  ripgrep
  rust
  ssh-agent
  terraform
  tmux
  tmuxinator
  vault
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
 FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

 autoload -Uz compinit
 compinit
fi

alias bathelp='bat --plain --language=help'
alias cat='bat -p -P'
alias https='http --default-scheme=https'
alias l='exa -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='exa'
alias lt="l -T -L 2"
alias ipython=ipython3

export EDITOR=vim
export VIEWER=bat
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fdfind --type file --color=always'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'
export GPG_TTY=$(tty)
export LESS='-SXFR'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=$HOME/.local/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
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
