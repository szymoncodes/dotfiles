#!/bin/bash
echo "Setup starting..."

echo "Brew installing..."
brew install fzf bat ripgrep stow starship zsh-autosuggestions zsh-syntax-highlighting sk fd fastfetch gcc gh
echo "Brew finished."

echo "Setting up basic project structure..."
uv init && uv venv && uv python install 3.14
mkdir -p src/${PWD##*/}
mkdir docs
mkdir data
mkdir exports
mv main.py src/${PWD##*/}/main.py

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --ignore="bootstrap.sh" --ignore=".aerospace.toml" --ignore=".config/ghostty/config" --adopt . && git restore .

echo "Cleaning home directory..."
cd && rm -rf .bash_logout .bashrc .oh-my-zsh .zcom*

echo "Installing LSPs, Linters, Formatters with Mason..."
nvim --headless -c "MasonInstall gopls lua-language-server prettier ruff stylua tinymist ty typstyle"

echo "Setup finished."
