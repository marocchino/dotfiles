# Dotfiles

## Installation

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/brewdler
brew bundle
./install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

If you using git, need to set `.gitconfig.local` file

```ini
[user]
  name = your name
  email = your@email.com
```
