function pkg
  if test $argv[1] = "list"
    pkgutil --pkgs
  else if test $argv[1] = "rm"
    sudo pkgutil --forget $argv[2]
    if test $status = 0
      echo
      echo " (╯°□°）╯︵" (echo $argv[2]|~/.config/fish/functions/flip ^/dev/null)
      echo
    end
  else
    echo "pkg list|rm"
  end
end
