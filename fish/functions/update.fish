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
    case boot2docker
      update-boot2docker
    case dotfiles
      update-dotfiles
    case all
      update-brew
      update-apt-get
      update-dotfiles
      update-vim
      update-motion
      update-boot2docker
    case '*'
      echo update what?
      echo please select form brew vim motion apt-get brew boot2docker all
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
    vim +PluginUpdate +qall
  end
end

function update-boot2docker
  if type boot2docker
    echo updating boot2docker
    boot2docker upgrade
  end
end

function update-dotfiles
  echo updating dotfiles
  pushd ~/dotfiles
  git pull
  popd
end

complete -c update -x -a "brew vim motion apt-get brew all"
