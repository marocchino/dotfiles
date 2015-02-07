function update
  if type brew
    echo updating brew
    brew update
    brew upgrade
    brew cleanup
  end
  if type apt-get
    echo updating apt-get
    sudo apt-get update -y
  end
  if type motion
    echo updating motion
    sudo motion update
  end
end
