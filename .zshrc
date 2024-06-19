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
  1password
  adb
  ag
  ansible
  ant
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
  kubectl
  nmap
  pass
  perl
  pip
  pipenv
  podman
  poetry
  postgres
  pre-commit
  python
  ripgrep
  rsync
  rust
  ssh-agent
  terraform
  tmux
  tmuxinator
  vagrant
  vault
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

alias bathelp='bat --plain --language=help'
alias cat='bat -p -P'
alias https='http --default-scheme=https'
alias l='exa -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='exa'
alias lt="l -T -L 2"
alias mux=tmuxinator
alias ipython=ipython3
alias vi=nvim
alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
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

