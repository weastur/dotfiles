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
  ansible
  aws
  brew
  direnv
  fd
  fzf
  gh
  git
  git-lfs
  gitignore
  gpg-agent
  httpie
  kubectl
  nmap
  pip
  podman
  poetry
  python
  ripgrep
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

alias bathelp='bat --plain --language=help'
alias cat='bat -p -P'
alias https='http --default-scheme=https'
alias l='exa -lga --group-directories-first --time-style=long-iso --color-scale'
alias ls='exa'
alias lt="l -T -L 2"
alias mux=tmuxinator
alias ipython=ipython3

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
fpath=(~/.config/zsh/completion_files /opt/homebrew/share/zsh-completions /Users/weastur/.oh-my-zsh/plugins/vault /Users/weastur/.oh-my-zsh/plugins/vagrant /Users/weastur/.oh-my-zsh/plugins/tmuxinator /Users/weastur/.oh-my-zsh/plugins/tmux /Users/weastur/.oh-my-zsh/plugins/terraform /Users/weastur/.oh-my-zsh/plugins/ssh-agent /Users/weastur/.oh-my-zsh/plugins/rust /Users/weastur/.oh-my-zsh/plugins/ripgrep /Users/weastur/.oh-my-zsh/plugins/python /Users/weastur/.oh-my-zsh/plugins/poetry /Users/weastur/.oh-my-zsh/plugins/podman /Users/weastur/.oh-my-zsh/plugins/pip /Users/weastur/.oh-my-zsh/plugins/nmap /Users/weastur/.oh-my-zsh/plugins/kubectl /Users/weastur/.oh-my-zsh/plugins/httpie /Users/weastur/.oh-my-zsh/plugins/gpg-agent /Users/weastur/.oh-my-zsh/plugins/gitignore /Users/weastur/.oh-my-zsh/plugins/git-lfs /Users/weastur/.oh-my-zsh/plugins/git /Users/weastur/.oh-my-zsh/plugins/gh /Users/weastur/.oh-my-zsh/plugins/fzf /Users/weastur/.oh-my-zsh/plugins/fd /Users/weastur/.oh-my-zsh/plugins/direnv /Users/weastur/.oh-my-zsh/plugins/brew /Users/weastur/.oh-my-zsh/plugins/aws /Users/weastur/.oh-my-zsh/plugins/ansible /Users/weastur/.oh-my-zsh/functions /Users/weastur/.oh-my-zsh/completions /Users/weastur/.oh-my-zsh/cache/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions /opt/homebrew/share/zsh/site-functions)
