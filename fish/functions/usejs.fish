function usejs
  switch $argv[1]
    case io iojs
      use-iojs
    case node nodejs
      use-nodejs
    case '*'
      echo update what?
      echo please select form iojs nodejs node io
  end
end

function use-nodejs
  brew unlink iojs
  brew link node
  echo Updating NPM
  npm install -g npm@latest
  echo Using Node.js
end

function use-iojs
  brew unlink node
  brew link --force iojs
  echo Updating NPM
  npm install -g npm@latest
  echo Using io.js
end
