set -o vi

# for python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export GOPATH="$HOME/.go"
export PATH="$HOME/Library/Python/3.6/bin/:/usr/local/sbin:$HOME/bin:$GOPATH/bin:$HOME/Documents/flutter_macos_v1.7.8+hotfix.4-stable/bin/cache/dart-sdk/bin:$HOME/Documents/flutter_macos_v1.7.8+hotfix.4-stable/bin:$HOME/dotfiles/bash/functions:/usr/local/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GIT_PROMPT_THEME=Single_line_Minimalist
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"

declare -a commends=("$HOME/.fzf.bash"
                     "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
                     "$HOME/.asdf/asdf.sh"
                     "$HOME/.asdf/completions/asdf.bash"
                     "$(brew --prefix)/etc/profile.d/z.sh"
                     "$HOME/Documents/bash-wakatime/bash-wakatime.sh"
                     "/usr/local/etc/bash_completion.d/git-completion.bash"
                     "$HOME/.travis/travis.sh"
                    )

function source_list () {
  for commend in "$@"; do
    if [ -f "$commend" ]; then
      # shellcheck source=/dev/null
      source "$commend"
    fi
  done
}
source_list "${commends[@]}"

# Git branch bash completion
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  # Add git completion to aliases
  __git_complete g __git_main
  __git_complete ga _git_add
  __git_complete gaa _git_add
  __git_complete gai _git_add
  __git_complete gs _git_switch
  __git_complete gr _git_restore
  __git_complete gd _git_branch
fi

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
alias iex="rlwrap -a foo iex"
alias m=mix
alias r=rails
alias sayk="say -v Yuna"
alias sayj="say -v Kyoko"
alias t='tmux attach || tmux -u'
alias v='nvim'
alias y=yarn

# wow! much doge!
alias much=git
alias so=nvim
alias such=git
alias very=git
alias wow="git status"
