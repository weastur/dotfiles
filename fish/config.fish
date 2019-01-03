set -x PATH $PATH /sbin/ /usr/sbin $HOME/opt/bin

set fish_greeting

. /usr/share/fzf/shell/key-bindings.fish

function fish_user_key_bindings
  fzf_key_bindings
end
