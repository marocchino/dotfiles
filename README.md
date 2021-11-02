# Dotfiles

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/brewdler
brew bundle
./install
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

If you using git, need to set `.gitconfig.local` file

```ini
[user]
  name = your name
  email = your@email.com
```
