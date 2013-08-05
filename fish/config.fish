set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/bin $PATH
rbenv rehash >/dev/null ^&1
function go
  git checkout $argv
end
. ~/.config/fish/profile.fish
