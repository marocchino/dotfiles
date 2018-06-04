alias aset=asdf
alias b=bundle
alias be="bundle exec"
alias c="open -a 'Google Chrome'"
alias chrome="open -a 'Google Chrome'"
alias e=elixir
alias g=git
alias ga="git add"
alias gaa="git add --all"
alias gai="git add --all --intent-to-add"
alias gg=exit
alias groot="cd (git rev-parse --show-toplevel)"
alias gs="git status"
alias iex="rlwrap -a foo iex"
alias m=mix
alias r=rails
alias sayk="say -v Yuna"
alias sayj="say -v Kyoko"
alias t='tmux attach || tmux -u'
alias v='vim'
alias y=yarn

# wow! much doge!
alias much=git
alias so=vim
alias such=git
alias very=git
alias wow="git status"


set -o vi
# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export GOPATH="$HOME/.go"
PATH="$HOME/Library/Python/3.6/bin/:/usr/local/sbin:$HOME/bin:$GOPATH/bin:$HOME/dotfiles/bash/functions:/usr/local/bin:$PATH"
export PATH
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  export GIT_PROMPT_THEME=Single_line_Minimalist
  # shellcheck source=/dev/null
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# shellcheck source=/dev/null
source $HOME/.asdf/asdf.sh
# shellcheck source=/dev/null
source $HOME/.asdf/completions/asdf.bash
source "$(brew --prefix)/etc/profile.d/z.sh"
