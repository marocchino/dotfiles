function gd
  if test (count $argv) = 0
    git branch | peco | xargs git branch -D
  else
    git branch -D $argv
  end
end
