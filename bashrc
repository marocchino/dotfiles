set -o vi

# for python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export GOPATH="$HOME/.go"
export PATH="$HOME/.cargo/bin:$HOME/Library/Python/3.6/bin/:/usr/local/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin:$HOME/bin:$GOPATH/bin:$HOME/Documents/flutter_macos_v1.9.1+hotfix.6-stable/bin/cache/dart-sdk/bin:$HOME/Documents/flutter_macos_v1.9.1+hotfix.6-stable/bin:$HOME/dotfiles/bash/functions:/usr/local/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GIT_PROMPT_THEME=Single_line_Minimalist
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

declare -a paths=(
  "/usr/local/etc/profile.d/z.sh"
  "/usr/local/etc/bash_completion.d/git-completion.bash"
  "/usr/local/etc/profile.d/bash_completion.sh"
  "$HOME/.asdf/asdf.sh"
  "$HOME/.asdf/completions/asdf.bash"
  "$HOME/.bashrc.local"
  "$HOME/.fzf.bash"
  "$HOME/.opam/opam-init/init.sh"
  "$HOME/Documents/bash-wakatime/bash-wakatime.sh"
  "$HOME/dotfiles/bash/completions/mix.sh"
  "$HOME/dotfiles/bash/completions/npm.sh"
  "$HOME/dotfiles/bash/functions/_up"
)
declare -a evals=(
  "$(hub alias -s)"
  "$(direnv hook bash)"
  "$(starship init bash)"
)

for p in "${paths[@]}"; do
  if [ -f "$p" ]; then
    # shellcheck source=/dev/null
    source "$p"
  fi
done
for e in "${evals[@]}"; do
  eval "$e"
done

if [[ "$(uname -s)" == "Darwin" ]]; then
  style=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
  toggle=$HOME/.toggle_dark
  if [[ $style == "Dark" ]]; then
    echo -ne "\033]50;SetProfile=Dark\a"
    touch "$toggle"
  else
    echo -ne "\033]50;SetProfile=Default\a"
    [ ! -e "$toggle" ] || rm "$toggle"
  fi
fi

alias aset=asdf
complete -F _asdf aset

alias bat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias c="open -a 'Google Chrome'"
alias chrome="open -a 'Google Chrome'"
alias d=docker
complete -F _docker d
alias dc=docker-compose
complete -F _docker_compose dc
alias e=elixir
alias ff="open -a Firefox"
alias firefox="open -a Firefox"
alias gg=exit
alias groot="cd (git rev-parse --show-toplevel)"
alias iex="rlwrap -a foo iex"
alias ls=lsd
alias m=mix
alias sayj="say -v Kyoko"
alias sayk="say -v Yuna"
alias t='tmux attach || tmux -u'
alias v='nvim'
alias y=yarn


# wow! much doge!
alias much=git
alias so=nvim
alias such=git
alias very=git
alias wow="git status"

# Git branch bash completion
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  function _git_aa() {
    _git_add
  }
  function _git_ai() {
    _git_add
  }
  function _git_ap() {
    _git_add
  }
  function _git_ca() {
    _git_commit
  }
  function _git_d() {
    _git_diff
  }
  function _git_ds() {
    _git_diff
  }
  function _git_f() {
    _git_fetch
  }
  function _git_fa() {
    _git_fetch
  }
  function _git_last() {
    _git_log
  }
  function _git_pushf() {
    _git_push
  }
  function _git_r() {
    _git_rebase
  }
  function _git_ra() {
    _git_rebase
  }
  function _git_rc() {
    _git_rebase
  }
  function _git_rh() {
    _git_rebase
  }
  function _git_ri() {
    _git_rebase
  }
  function _git_st() {
    _git_status
  }
  function _git_ski() {
    _git_stash
  }
  function _git_w() {
    _git_whatchanged
  }
  function _git_wip() {
    _git_commit
  }

  # Add git completion to aliases
  alias g=git
  __git_complete g __git_main
  alias ga="git add"
  __git_complete ga _git_add
  alias gaa="git add --all"
  __git_complete gaa _git_add
  alias gai="git add --all --intent-to-add"
  __git_complete gai _git_add
  __git_complete gs _git_switch
  __git_complete gr _git_restore
  __git_complete gd _git_branch
fi
# see: https://github.com/github/hub#aliasing
