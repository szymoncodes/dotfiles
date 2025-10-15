!#/bin/bash
set -e 

echo "Starting Mac setup..."

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade

brew install git git-credential-manager fzf bat ripgrep quarto stow starship tmux zsh-autosuggestions zsh-syntax-highlighting sk fd fastfetch gcc uv spotify gh
brew install neovim --HEAD
brew install --cask ghostty 1password 1password-cli zen nikitabobko/tap/aerospace font-jetbrains-mono

echo "Configuring Mac defaults..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock persistent-apps -array \
  '<dict><key>tile-data</key><dict><key>file-data</key>
    <dict><key>_CFURLString</key><string>/Applications/Ghostty.app</string>
    <key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' \
  '<dict><key>tile-data</key><dict><key>file-data</key>
    <dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string>
    <key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' \
  '<dict><key>tile-data</key><dict><key>file-data</key>
    <dict><key>_CFURLString</key><string>/Applications/Spotify.app</string>
    <key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' \
  '<dict><key>tile-data</key><dict><key>file-data</key>
    <dict><key>_CFURLString</key><string>/System/Applications/Music.app</string>
    <key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder CreateDesktop -bool false
# defaults write com.apple.finder NewWindowTarget -string "file://$HOME/Documents/"
defaults write com.apple.finder ShowStatusBar -bool true

sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false


killall Dock Finder || true

echo "Setup complete. Restart recommended"

