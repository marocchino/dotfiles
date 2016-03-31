function recursive_replace
  set arg_count (count $argv)
  if [ $arg_count != 2 ]
    echo "expecting two arguments."
    return
  end

  echo replacing from $argv[1] to $argv[2]
  sed -i '' -e "s/$argv[1]/$argv[2]/g" (git grep -e $argv[1] --name-only)
end
