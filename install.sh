# xcode check
# install homebrew
#ruby -e "$(curl -fsSLk https://gist.github.com/raw/323731/install_homebrew.rb)"

# install git
#brew install git

# install curl
#brew install curl
#bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

# install npm
#brew install node
#curl http://npmjs.org/install.sh | sh

# install etc
#brew install macvim zsh
#npm install -g coffee-script

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/irbrc ~/.irbrc
cd ~/dotfiles
git submodule init
git submodule update
