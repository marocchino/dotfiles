function gc
  if test (count $argv) = 0
    git branch | fzf | xargs git checkout
  else
    git checkout $argv
  end
end
