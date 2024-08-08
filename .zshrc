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
  rbenv
  ripgrep
  rsync
  rust
  ssh-agent
  tmux
  tmuxinator
)

zstyle :omz:plugins:ssh-agent identities /Users/weastur/.ssh/id_ed25519 /Users/weastur/.ssh/id_ed25519_work

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias bathelp='bat --plain --language=help --theme=Monokai\ Extended'
alias cat='bat -p -P --theme=Monokai\ Extended'
alias docker=podman
alias grep='grep --color=auto --binary-files=without-match --exclude-dir=.git --exclude-dir=.cache'
alias https='http --default-scheme=https'
alias ipython=ipython3
alias l='eza -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='eza'
alias lt="l -T -L 2"
alias mc='mc --nosubshell'
alias vi=vim
alias vim=vim

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes
export BORG_RSH="ssh -i /Users/weastur/id_ed25519_work"
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes
export CONTAINERS_MACHINE_PROVIDER=applehv
export EDITOR=vim
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi --color=dark'
export GPG_TTY=$(tty)
export HOMEBREW_BAT=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export LESS='-SXFR'
export LESSOPEN="| /opt/homebrew/bin/src-hilite-lesspipe.sh %s"
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme=Monokai\ Extended'"
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export VISUAL=vim

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
  git diff --name-only --relative --diff-filter=d | xargs bat --diff --theme=Monokai\ Extended
}

help() {
  "$@" --help 2>&1 | bathelp
}
