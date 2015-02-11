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
    case all
      update-brew
      update-apt-get
      update-motion
      update-vim
    case '*'
      echo update what?
      echo please select form brew vim motion apt-get brew all
  end
end

function update-brew
  if type brew
    echo updating brew
    brew update
    brew upgrade
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

complete -c update -x -a "brew vim motion apt-get brew all"
