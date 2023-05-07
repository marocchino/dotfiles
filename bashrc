# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
set -o vi

HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-$(brew --prefix)}
declare -a PATHS=(
  "$HOMEBREW_PREFIX/etc/profile.d/z.sh"
  "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"
  "$HOME/.bashrc.local"
  "$HOME/.fzf.bash"
  "$HOME/.opam/opam-init/init.sh"
  "$HOME/Documents/bash-wakatime/bash-wakatime.sh"
  "$HOME/dotfiles/bash/completions/mix.sh"
  "$HOME/dotfiles/bash/completions/npm.sh"
  "$HOME/dotfiles/bash/completions/git.sh"
  "$HOME/dotfiles/bash/functions/_man"
  "$HOME/dotfiles/bash/functions/_up"
  "$HOME/dotfiles/bash/functions/_z"
)

for P in "${PATHS[@]}"; do
  if [ -f "$P" ]; then
    # shellcheck source=/dev/null
    source "$P"
  fi
done

# for python
export HOMEBREW_PREFIX
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export GOPATH="$HOME/.go"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$HOMEBREW_PREFIX/sbin:/Library/Apple/usr/bin:$HOME/bin:$GOPATH/bin:$HOME/.luarocks/bin:$HOME/dotfiles/bash/functions:$HOMEBREW_PREFIX/bin:$PATH"
YARN_GLOBAL_PATH=$(yarn global bin)
export PATH="$YARN_GLOBAL_PATH:$PATH"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GIT_PROMPT_THEME=Single_line_Minimalist
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export BASH_COMPLETION_COMPAT_DIR="$HOMEBREW_PREFIX/etc/bash_completion.d"

declare -a EVALS=(
  "$(rtx activate bash)"
  "$(hub alias -s)"
  "$(direnv hook bash)"
  "$(starship init bash)"
  "$(github-copilot-cli alias -- "$0")"
)

for E in "${EVALS[@]}"; do
  eval "$E"
done


if [[ "$(uname -s)" == "Darwin" ]]; then
  STYLE=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
  TOGGLE=$HOME/.toggle_dark
  if [[ $STYLE == "Dark" ]]; then
    echo -ne "\033]50;SetProfile=Dark\a"
    touch "$TOGGLE"
  else
    echo -ne "\033]50;SetProfile=Default\a"
    [ ! -e "$TOGGLE" ] || rm "$TOGGLE"
  fi
fi

# FZF

export FZF_TMUX_OPTS='-p80%,60%'
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window down:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
fi
command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

alias asdf=rtx

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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
