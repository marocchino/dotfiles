function pmvim
  if test (count $argv) = 0
    find * -type f | peco $peco_flags | read filename
    if test (count $filename) = 0
    else
      mvim --servername VIM --remote-tab $filename
    end
  else
    mvim --servername VIM --remote-tab $argv
  end
end
