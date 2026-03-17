#!/bin/bash

echo "Setup starting..."
echo "Brew installing..."
brew install neovim --HEAD
brew install fzf bat ripgrep stow starship tmux zsh-autosuggestions zsh-syntax-highlighting sk fd fastfetch gcc uv gh zsh
echo "Brew finished."

echo "Changing shell to zsh..."
sudo usermod -s /bin/zsh vscode
echo "Shell updated."

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --adopt . && git restore .

echo "Setup finished."
