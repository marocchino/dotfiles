function yoda
  if not which lolcat > /dev/null
    gem install lolcat
  end
  if not which yodaism > /dev/null
    gem install yodaism
  end
  yodaism ascii | lolcat
end
