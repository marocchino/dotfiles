function pmvim
  find * -type f | peco $peco_flags | read filename
  if test (count $filename) = 0
  else
    mvim $filename
  end
end
