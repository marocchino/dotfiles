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
alias t='tmux attach || tmux'
alias v=vim

# wow! much doge!
alias much=git
alias so=vim
alias such=git
alias very=git
alias wow="git status"


set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export EDITOR=vim
export PATH="/usr/local/sbin:$HOME/bin:$HOME/.rbenv/bin:$HOME/dotfiles/bash/functions:$PATH"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [[ -d $HOME/.nvm ]]; then
  export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Single_line
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
