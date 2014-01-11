set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/bin $PATH
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/platform-tools
set -x PATH $PATH $ANDROID_HOME/build-tools
set -x PATH $PATH /Applications/Kindle\ Previewer.app/Contents/MacOS/lib
rbenv rehash >/dev/null ^&1
. ~/.config/fish/profile.fish
