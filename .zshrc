eval "$(starship init zsh)"
fastfetch

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^f' forward-word
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

simple_ai(){
  ollama run gpt-oss:20b-cloud --hidethinking
}
alias "??"=simple_ai
export TERM=xterm-256color
export SSH_AUTH_SOCK=/Users/szymon/.ssh/proton-pass-ssh-agent.sock
