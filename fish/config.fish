alias b bundle
alias be "bundle exec"
alias c "open -a 'Google Chrome'"
alias chrome "open -a 'Google Chrome'"
alias e elixir
alias g git
alias ga "git add"
alias gg exit
alias groot "cd (git rev-parse --show-toplevel)"
alias gs "git status"
alias iex "rlwrap -a foo iex"
alias m mix
alias n npm
alias r rails
alias s spring
alias t tmux
alias v fmvim
alias asdf mise

# wow! much doge!
alias much git
alias so fmvim
alias such git
alias very git
alias wow "git status"

set -x PATH $HOMEBREW_PREFIX/bin $PATH
set -x NODE_PATH $HOMEBREW_PREFIX/lib/node_modules

if test -f $HOME/.config/fish/profile.fish
  source $HOME/.config/fish/profile.fish
end

fish_user_key_bindings

mise activate fish | source
