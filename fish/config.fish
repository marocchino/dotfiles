set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/bin $PATH
set -x DYLD_LIBRARY_PATH $HOME/Dropbox/Development/dotfiles/instantclient_11_2
rbenv rehash >/dev/null ^&1
. ~/.config/fish/profile.fish
