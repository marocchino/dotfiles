set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $HOME/.rbenv/bin /Users/marocchino/.rbenv/versions/2.0.0-p0/bin $PATH
rbenv rehash >/dev/null ^&1
function go
  git checkout $argv
end
