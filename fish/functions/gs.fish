function gs
  if test (count $argv) = 0
    git branch | fzf | xargs git switch
  else
    git switch $argv
  end
end
