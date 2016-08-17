set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $PATH /Applications/Kindle\ Previewer.app/Contents/MacOS/lib
rbenv rehash >/dev/null ^&1
fish_user_key_bindings
source ~/.config/fish/profile.fish

alias b bundle
alias be "bundle exec"
alias g git
alias ga "git add"
alias gg exit
alias groot "cd (git rev-parse --show-toplevel)"
alias gs "git status"
alias r rails
alias s spring
alias t tmux
alias v pmvim

# wow! much doge!
alias much git
alias so pmvim
alias such git
alias very git
alias wow "git status"

fish_vi_key_bindings
