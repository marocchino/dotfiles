rvm > /dev/null
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/share/npm/bin $PATH
function go
  git checkout $argv
end
