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
