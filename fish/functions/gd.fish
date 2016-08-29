function gd
  if test (count $argv) = 0
    git branch | fzf | xargs git branch -D
  else
    git branch -D $argv
  end
end
