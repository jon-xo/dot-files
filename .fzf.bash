# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jonn/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jonn/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jonn/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jonn/.fzf/shell/key-bindings.bash"
