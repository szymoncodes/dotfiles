eval "$(starship init zsh)"
fastfetch

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

simple_ai(){
  ollama run glm-5:cloud "$*" --hidethinking
  # opencode run "$*"
}
alias "??"=simple_ai
