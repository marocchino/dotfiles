function open_github
  if test (git remote -v | wc -l) -eq 2
    set GITHUB_URL (git remote -v | awk '{ print $2 }' | head -1)
  else
    set GITHUB_URL (git remote -v | grep -v origin | awk '{ print $2 }' | head -1)
  end

  set GITHUB_URL (echo $GITHUB_URL | sed -e 's/\.git//g' | sed -e 's/git@github.com:/https:\/\/github.com\//')
  open $GITHUB_URL
end
