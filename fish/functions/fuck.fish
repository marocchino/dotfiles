function fuck
  ps aux | fzf | read line
  echo $line | awk '{print $11}' | read process_name
  echo $line | awk '{print $2}' | read pid
  kill -9 $pid
  if test $status = 0
    echo
    echo " (╯°□°）╯︵" (echo $process_name|~/.config/fish/functions/flip ^/dev/null)
    echo
  end
end
