function all_your_base_is_mine
  cat ~/.ssh/id_rsa.pub | ssh $argv 'cat >> ~/.ssh/authorized_keys'
end

for host in (sed -e 's/,.*$//' -e 's/ .*$//' ~/.ssh/known_hosts)
  complete -x -c all_your_base_is_mine -a $host
end
