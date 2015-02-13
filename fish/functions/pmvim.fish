function pmvim
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end
  set pwd (pwd)"/"
  echo $pwd
  ls ** | peco $peco_flags | read filename
  mvim $filename
end
