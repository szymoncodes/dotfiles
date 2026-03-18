#!/bin/bash
echo "Setup starting..."

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.zshrc

echo "Brew installing..."
brew install fzf bat ripgrep stow starship zsh-autosuggestions zsh-syntax-highlighting sk fd fastfetch gcc gh python@3.14 golang npm
echo "Brew finished."

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --ignore="bootstrap.sh" --ignore=".aerospace.toml" --ignore=".config/ghostty/config" --adopt . && git restore .

echo "Installing LSPs, Linters, Formatters with Mason..."
nvim --headless -c "MasonInstall gopls lua-language-server prettier ruff stylua tinymist ty typstyle"

echo "Setup finished."
