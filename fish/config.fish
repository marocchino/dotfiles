rvm > /dev/null
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
function go
  git checkout $argv
end
