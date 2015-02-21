set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
set -x NODE_PATH /usr/local/lib/node_modules
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $PATH /Applications/Kindle\ Previewer.app/Contents/MacOS/lib
rbenv rehash >/dev/null ^&1
set -x DOCKER_HOST tcp://boot2docker:2376
set -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
fish_user_key_bindings
source ~/.config/fish/profile.fish

alias b bundle
alias be "bundle exec"
alias g git
alias gg exit
alias r rails
alias s spring
alias sr "spring rails"
alias t tmux
alias v pmvim

# wow! much doge!
alias much git
alias so pmvim
alias such git
alias very git
alias wow "git status"
