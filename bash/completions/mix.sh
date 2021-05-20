#!/bin/bash

# code from https://github.com/dalexj/mix_autocomplete

_mix() {
  declare -g _last_mix_md5
  declare -g _mix_task_list
  declare current_mix_md5

  if ! type mix &>/dev/null; then
    return 1
  fi

  current_mix_md5=$(_mix_caculate)
  if [[ "$current_mix_md5" != "$_last_mix_md5" ]]; then
    _mix_task_list="$(mix help --names | xargs echo)"
  fi

  _last_mix_md5=$current_mix_md5
  cur="${COMP_WORDS[COMP_CWORD]}"
  IFS=" " read -r -a COMPREPLY <<< "$(compgen -W "$_mix_task_list" "$cur" | xargs echo)"
  return 0
}

_mix_caculate() {
  if ! [ -e mix.exs ]; then
    asdf current elixir
  elif type "md5" &>/dev/null; then
    md5 -q mix.exs
  elif type "md5sum" &>/dev/null; then
    md5sum mix.exs | awk '{ print $1 }'
  else
    echo ""
  fi
}

complete -o bashdefault -o default -o nospace -F _mix mix
