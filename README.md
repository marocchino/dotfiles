# Dotfiles

## Installation

To install dotfiles on your system, follow these steps:

1. Install Homebrew by running the following command:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
2. Tap brewdler by running this command:
    ```bash
    brew tap homebrew/brewdler
    ```
3. Install the packages specified in the `Brewfile` located in the dotfiles
 directory by running this command:
    ```bash
    brew bundle
    ```
4. Run the installation script by running the following command:
    ```bash
    ./install
    ```
5. If you use git, set the `.gitconfig.local` file by adding this configuration
 block to the file:
    ```ini
    [user]
      name = your name
      email = your@email.com
    ```
6. Finally, if you use tmux, clone the tpm repository by running the following
 command:
    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```