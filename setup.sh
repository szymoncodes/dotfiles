#!/bin/bash
echo "Setup starting..."

echo "Brew installing..."
brew install fzf bat ripgrep stow starship zsh-autosuggestions zsh-syntax-highlighting sk fd fastfetch gcc gh
echo "Brew finished."

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --adopt . && git restore .

echo "Setup finished."
