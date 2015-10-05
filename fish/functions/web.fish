function web
  switch $argv[1]
    case github
      web-github
    case site
      web-site
    case '*'
      echo 'open what?'
      echo 'please select from [github, site]'
  end
end

function web-github
  if test (git remote -v | wc -l) -eq 2
    set GITHUB_URL (git remote -v | awk '{ print $2 }' | head -1)
  else
    git remote -v | grep -v fetch | awk '{ print $2 }' | peco | read GITHUB_URL
  end

  set GITHUB_URL (echo $GITHUB_URL | sed -e 's/\.git//g' | sed -e 's/git@github.com:/https:\/\/github.com\//')
  open $GITHUB_URL
end

function web-site
  open http://(docker-machine ip dev):3000/
  echo http://(docker-machine ip dev):3000/
end

complete -x -c web -d 'web' -a 'github site'
