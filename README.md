# Dotfiles

## Installation

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/brewdler
brew bundle
./install
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

If you using git, need to set `.gitconfig.local` file

```ini
[user]
  name = your name
  email = your@email.com
```
