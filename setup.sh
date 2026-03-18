#!/bin/bash
echo "Setup starting..."

echo "Stowing dotfiles..."
cd && cd dotfiles && stow --ignore="bootstrap.sh" --ignore=".aerospace.toml" --ignore=".config/ghostty/config" --adopt . && git restore .

echo "Installing LSPs, Linters, Formatters with Mason..."
nvim --headless -c "MasonInstall gopls lua-language-server prettier ruff stylua tinymist ty typstyle"

echo "Setup finished."
