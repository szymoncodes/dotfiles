#!/bin/bash
echo "Setup starting..."

echo "Installing tools..."
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
packages=(
  fzf
  bat
  fd
  ripgrep
  stow
  starship
  gcc
  tmux
)

for pkg in "${packages[@]}"; do
  echo "Installing $pkg..."
  brew install "$pkg"
done

echo "Installing neovim nightly..."
brew install neovim --HEAD

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --ignore="bootstrap.sh" --ignore=".aerospace.toml" --ignore=".config/ghostty/config" --adopt . && git restore .

echo "Installing LSPs, Linters, Formatters with Mason..."
nvim --headless -c "MasonInstall gopls lua-language-server prettier ruff stylua tinymist ty typstyle"

echo "Setup finished."
