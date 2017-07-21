function update
  switch $argv[1]
    case brew
      update-brew
    case apt-get
      update-apt-get
    case motion
      update-motion
    case vim mvim
      update-vim
    case docker-machine
      update-docker-machine
    case dotfiles
      update-dotfiles
    case npm
      update-npm
    case all
      update-brew
      update-apt-get
      update-dotfiles
      update-vim
      update-motion
      update-npm
      update-docker-machine
    case '*'
      echo 'update what?'
      echo please select from [dotfiles, brew, vim, motion, apt-get, brew, docker-machine, npm, all]
  end
end

function update-brew
  if type brew
    echo updating brew
    brew update
    brew upgrade --all
    brew cleanup
  end
end

function update-apt-get
  if type apt-get
    echo updating apt-get
    sudo apt-get update -y
  end
end

function update-motion
  if type motion
    echo updating motion
    sudo motion update
  end
end

function update-vim
  if type vim
    echo updating vim
    vim +PlugUpdate +qall
  end
end

function update-npm
  if type npm
    echo updating npm
    npm-check -u -g
  end
end

function update-docker-machine
  if type docker-machine
    echo updating docker-machine
    docker-machine upgrade
  end
end

function update-dotfiles
  echo updating dotfiles
  pushd ~/dotfiles
  git pull
  popd
end

complete -x -c update -d 'update' -a 'brew vim motion apt-get brew dotfiles npm all'
