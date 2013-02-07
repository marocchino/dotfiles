set -x PATH $HOME/.rbenv/shims $HOME/.rbenv/bin /usr/local/bin /usr/local/sbin /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
rbenv rehash >/dev/null ^&1
function go
  git checkout $argv
end
