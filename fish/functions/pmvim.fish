function pmvim
  if test (count $argv) = 0
    find * -type f | peco $peco_flags | read filename
    if test (count $filename) = 0
    else
      mvim --servername (git rev-parse --show-toplevel) --remote-tab $filename
    end
  else
    mvim --servername (git rev-parse --show-toplevel) --remote-tab $argv
  end
end
