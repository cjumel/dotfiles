# [[ General options ]]

# External tools' commands
export FZF_FILE_PROMPT='Files > '
export FZF_DIR_PROMPT='Directories > '
export FZF_FD_COMMAND='fd --hidden .'
export FZF_FD_FILE_COMMAND='fd --type f --hidden .'
export FZF_FD_DIR_COMMAND='fd --type d --hidden .'
export FZF_FILE_PREVIEW='bat --color=always {}'
export FZF_DIR_PREVIEW='eza -la --color=always {}'

# General `fzf` options
export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND"
export FZF_DEFAULT_OPTS='--layout=reverse --height=100% --border'

# [[ Key bindings ]]
# `fzf` define 3 key bindings:
#  - <Ctrl-T> to insert a file or directory path in the command line
#  - <Ctrl-R> to insert a command from the command history
#  - <Alt-C> to `cd` to a directory

# <Ctrl-T>
# Use <Ctrl-T> once to search for files or twice to search for directories
# When searching for directories, use <Ctrl-R> (revert) to revert the search to files
# Not using <Ctrl-F> & <Ctrl-D> makes <Ctrl-D> available to exit `fzf`
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"
export FZF_CTRL_T_OPTS="
    --prompt '$FZF_FILE_PROMPT'
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-i:toggle-preview'
    --bind 'ctrl-t:reload(eval $FZF_FD_DIR_COMMAND)+change-preview($FZF_DIR_PREVIEW)+change-prompt($FZF_DIR_PROMPT)'
    --bind 'ctrl-r:reload(eval $FZF_FD_FILE_COMMAND)+change-preview($FZF_FILE_PREVIEW)+change-prompt($FZF_FILE_PROMPT)'
"

# <Alt-C>
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_OPTS="
    --prompt '$FZF_DIR_PROMPT'
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-i:toggle-preview'
"

# [[ Completion ]]
# `fzf` defines command line completion by entering a trigger character and then <Tab> or <Ctrl-I>
# Completion is contextual, that is in some cases it can detect wether a file or a directory is expected for instance

# Default trigger completion is `**`
# Let's change it to `^`, a one key-stroke character (against 3 for `**`)
export FZF_COMPLETION_TRIGGER='^'

# Override the default completion functions to customize the completion behavior
# In the following functions, $1 is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden . "$1"
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

# [[ Alias features ]]

# Use fzf to fuzzy search aliases and paste the selected one to the command line
function alias_fzf_fuzzy_search() {
    selected_line=$(alias | fzf)

    # Exit if nothing is selected
    if [[ -z $selected_line ]]; then
        return
    fi

    # Extract the alias name from the selected line (selected line has the format "alias=command")
    selected_alias=${selected_line%%=*}

    # Paste the alias to the command line
    print -z "$selected_alias"
}

# Use fzf to select an alias file and edit it using vi
function alias_fzf_edit() {
    # Use builtin ls even if eza is aliased to ls
    selected_file=$(command ls "$ZSH_CUSTOM" | fzf)

    # Exit if nothing is selected
    if [[ -z $selected_file ]]; then
        return
    fi

    vi "$ZSH_CUSTOM/$selected_file"
}

alias alf='alias_fzf_fuzzy_search'
alias ale='alias_fzf_edit'

# [[ Theme features ]]
# Manage themes for WezTerm, Tmux, and Neovim at the same time

TERMINAL_THEMES='catppuccin-frappe
catppuccin-macchiato
catppuccin-mocha
catppuccin-latte
gruvbox-dark
gruvbox-light
kanagawa
nord
rose-pine
rose-pine-dawn
rose-pine-moon
tokyonight'

# Pick a theme with fzf and set it up by creating the relevant symlinks
function theme_fzf_picker() {
    # Make the user select a theme using fzf among the available ones
    selected_theme=$(echo "$TERMINAL_THEMES" | fzf)

    # Exit if no theme is selected, to avoid creating broken symlinks
    if [[ -z $selected_theme ]]; then
        return
    fi

    # Create symlinks to the selected theme (overwrite existing ones)
    ln -sf ~/.config/wezterm/config/themes/"$selected_theme".lua ~/.config/wezterm/theme.lua
    ln -sf ~/.config/tmux/themes/tmux-"$selected_theme".conf ~/.config/tmux/tmux-theme.conf
    ln -sf ~/.config/tmux/themes/tmux-"$selected_theme"-post.conf ~/.config/tmux/tmux-theme-post.conf
    ln -sf ~/.config/nvim/lua/themes/"$selected_theme".lua ~/.config/nvim/lua/theme.lua
}

alias th='theme_fzf_picker'
