function pmvim
  if test (count $argv) = 0
    find * -type f | peco $peco_flags | read filename
    if test (count $filename) = 0
    else
      mvim $filename
    end
  else
    mvim $argv
  end
end
