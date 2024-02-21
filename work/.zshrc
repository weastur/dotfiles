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
  ansible
  aws
  brew
  direnv
  docker
  docker-compose
  fd
  fzf
  git
  git-lfs
  gitignore
  gpg-agent
  helm
  httpie
  kubectl
  nmap
  pip
  podman
  poetry
  python
  ripgrep
  rust
  #ssh-agent
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

eval "$(rbenv init - zsh)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias bathelp='bat --plain --theme="Solarized (dark)" --language=help'
alias cat='bat --theme="Solarized (dark)" -p -P'
alias https='http --default-scheme=https'
alias l='exa -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='exa'
alias lt="l -T -L 2"
alias mux=tmuxinator

export ANSIBLE_NOCOWS=1
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
export LESS='-SXFR'
export MANPAGER="sh -c 'col -bx | bat --theme=\"Solarized (dark)\" -l man -p'"
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EKSCTL_ENABLE_CREDENTIAL_CACHE=1
export CONTAINERS_MACHINE_PROVIDER=applehv

fpath=($fpath ~/.zsh/completion)

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
    git diff --name-only --relative --diff-filter=d | xargs bat --theme='Solarized (dark)' --diff
}

help() {
    "$@" --help 2>&1 | bathelp
}
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export SSH_AUTH_SOCK="/Users/weastur/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

source .easybrain.aliases.sh
