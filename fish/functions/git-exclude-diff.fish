function git-exclude-diff
  if test -z $argv
    echo "SYNOPSIS"
    echo "git-exclude-diff [<commit>] [<path>] [<exclude_pattern>]"
    echo "example:"
    echo "  git-exclude-diff  9484d0f..HEAD docs/ 'docs/*/*.ko-KR.md'"
  else
    set COMMIT $argv[1]
    set INCLUDE_PATH $argv[2]
    set EXCLUDE_PATTERN $argv[3]
    git diff $COMMIT --name-only -- $INCLUDE_PATH | grep -v $EXCLUDE_PATTERN | xargs git diff $COMMIT --
  end
end
