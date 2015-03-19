function yoda
  if not type -P lolcat > /dev/null
    gem install lolcat
  end
  if not type -P yodaism > /dev/null
    gem install yodaism
  end
  yodaism ascii | lolcat
end
