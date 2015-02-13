function go
  if test (count $argv) = 0
    git branch | peco | xargs git checkout
  else
    git checkout $argv
  end
end
