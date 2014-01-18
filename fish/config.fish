set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $PATH /Applications/Kindle\ Previewer.app/Contents/MacOS/lib
rbenv rehash >/dev/null ^&1
. ~/.config/fish/profile.fish
