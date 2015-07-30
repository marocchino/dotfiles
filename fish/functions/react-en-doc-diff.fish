function react-en-doc-diff
  if test -z $argv
    echo "SYNOPSIS"
    echo "react-en-doc-diff [<commit>]"
    echo "example:"
    echo "  react-en-doc-diff 9484d0f..HEAD"
  else
    set COMMIT $argv[1]
    set FILES (git diff $COMMIT --name-only -- docs | grep  -v -e 'ko-KR\|ja-JP\|zh-CN')
    git diff $COMMIT -- $FILES > diff
  end
end
