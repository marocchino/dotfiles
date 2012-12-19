set fish_git_dirty_color  red
set fish_git_branch_color purple
set fish_ruby_version_color yellow

function prompt_git_dirty
  git diff > /dev/null 2>&1
  if test $status != 0
    echo ' ✗'
  end
end

function prompt_ruby_version
  printf '%s(%s) ' (set_color $fish_ruby_version_color) (ruby --version | cut -d' ' -f1,2)
end

function prompt_git_branch
  set -l branch (git symbolic-ref HEAD 2> /dev/null | cut -d/ -f3-)
  if test -n "$branch"
    printf "%s[%s%s] " (set_color $fish_git_branch_color) $branch (prompt_git_dirty)
  end
end

function prompt_dollor
  printf '%s$ ' (set_color $fish_color_normal)
end

function fish_prompt
  printf '%s%s %s%s %s%s%s%s' (set_color aaaaaa) (hostname|cut -d . -f 1) (set_color 00ffff) (prompt_pwd) (prompt_git_branch) (prompt_ruby_version) (prompt_dollor)
end
