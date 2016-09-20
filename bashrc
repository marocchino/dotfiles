alias b=bundle
alias be="bundle exec"
alias c="open -a 'Google Chrome'"
alias chrome="open -a 'Google Chrome'"
alias e=elixir
alias g=git
alias ga="git add"
alias gg=exit
alias groot="cd (git rev-parse --show-toplevel)"
alias gs="git status"
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export EDITOR=vim
export PATH="$HOME/.rbenv/bin:$PATH"

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Single_line
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
