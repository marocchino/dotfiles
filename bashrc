alias b=bundle
alias be="bundle exec"
alias c="open -a 'Google Chrome'"
alias ctags="`brew --prefix`/bin/ctags"
alias chrome="open -a 'Google Chrome'"
alias e=elixir
alias g=git
alias ga="git add"
alias gg=exit
alias groot="cd (git rev-parse --show-toplevel)"
alias gs="git status"
alias iex="rlwrap -a foo iex"
alias m=mix
alias n=npm
alias r=rails
alias s=spring
alias t='tmux attach || tmux -u'
alias v=vim

# wow! much doge!
alias much=git
alias so=vim
alias such=git
alias very=git
alias wow="git status"


set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export GOPATH="$HOME/.go"
PATH="/usr/local/sbin:$HOME/bin:$GOPATH/bin:$HOME/dotfiles/bash/functions:$PATH"
export PATH
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Single_line_Minimalist
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi


. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
