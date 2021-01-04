# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jonn/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jonn/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jonn/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jonn/.fzf/shell/key-bindings.zsh"

