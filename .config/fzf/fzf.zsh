# [[ Options ]]

# Change layout of fzf
export FZF_DEFAULT_OPTS='--layout=reverse --border'

# Use fd for the default fzf command
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude .git'

# Use fd for fzf key bindings
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# Change the trigger for fzf auto-completion
export FZF_COMPLETION_TRIGGER='^'

# Use fd for fzf auto-completion
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}

# [[ Setup ]]

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
source "/usr/local/opt/fzf/shell/completion.zsh"

# Key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
# Enable the use of <Alt-c> as fzf key binding
bindkey "©" fzf-cd-widget
