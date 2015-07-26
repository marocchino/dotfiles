function diff_dir
  for i in (ls $argv[1])
    echo $i
    diff $argv[1]/$i $argv[2]/$i
  end
end
