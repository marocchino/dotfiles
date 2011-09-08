for i in $(cat .gitmodules|grep path\\b|sed 's/path = //')
  do cd $i
  git checkout master
  git pull
  1
done
