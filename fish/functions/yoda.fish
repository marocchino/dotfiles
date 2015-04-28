function yoda
  if not rbenv which lolcat > /dev/null
    gem install lolcat
  end
  if not rbenv which yodaism > /dev/null
    gem install yodaism
  end
  yodaism ascii | lolcat
end
