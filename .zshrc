# Prompt Configuration
PROMPT='%F{086}%~%f '

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

# Keybindings for Navigation
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Aliases
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias update='sudo apt update && sudo apt upgrade -y'
alias gst='git status'
alias gco='git checkout'
alias gp='git push'

# Basic Syntax Highlighting
preexec_highlight() {
  # Highlight commands based on simple checks (e.g., mistyped commands)
  if ! command -v ${1%% *} &>/dev/null; then
    print -P "%F{red}Command not found: %f$1"
  fi
}
precmd_highlight() {
  # Reset highlight after command execution
  print -P "%F{reset}"
}
preexec() { preexec_highlight "$1"; }
precmd() { precmd_highlight; }

# Basic Autosuggestions (Manual Approximation)
# Suggest based on history
zsh_autosuggest() {
  BUFFER="$BUFFER$(history | grep -i "$BUFFER" | tail -n 1 | sed 's/^ *[0-9]* *//')"
  zle end-of-line
}
bindkey '^[[Z' zsh_autosuggest

# Colors
autoload -U colors && colors
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
