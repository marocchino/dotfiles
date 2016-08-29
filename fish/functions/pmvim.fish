function pmvim
  if test (count $argv) = 0
    find * -type f | fzf | read filename
    if test (count $filename) = 0
      mvim
    else
      mvim --servername (git rev-parse --show-toplevel) --remote-tab $filename
    end
  else
    mvim --servername (git rev-parse --show-toplevel) --remote-tab $argv
  end
end
