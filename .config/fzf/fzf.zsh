# [[ General options ]]

# Prompts
export FZF_FILE_PROMPT='File > '
export FZF_DIR_PROMPT='Directory > '
export FZF_CMD_PROMPT='Command > '
export FZF_ALIAS_PROMPT='Alias > '
export FZF_THEME_PROMPT='Theme > '

# `fd` commands
export FZF_FD_COMMAND='fd .'
export FZF_FD_COMMAND_HIDDEN='fd --hidden .'
export FZF_FD_COMMAND_ALL='fd --hidden --no-ignore --exclude .git .'
export FZF_FD_FILE_COMMAND='fd --type f .'
export FZF_FD_FILE_COMMAND_HIDDEN='fd --type f --hidden .'
export FZF_FD_FILE_COMMAND_ALL='fd --type f --hidden --no-ignore --exclude .git .'
export FZF_FD_DIR_COMMAND='fd --type d .'
export FZF_FD_DIR_COMMAND_HIDDEN='fd --type d --hidden .'
export FZF_FD_DIR_COMMAND_ALL='fd --type d --hidden --no-ignore --exclude .git .'

# Previewers
# Escaped versions are necessary to change the preview in transform actions
export FZF_FILE_PREVIEW='bat --color=always {}'
export FZF_FILE_PREVIEW_ESCAPED='bat --color=always \{}'
export FZF_DIR_PREVIEW='eza -la --color=always {}'
export FZF_DIR_PREVIEW_ESCAPED='eza -la --color=always \{}'

# General `fzf` options
export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND"
# ctrl-] is actually ctrl-$ on my keyboard; rationale for this binding is that mapping it to a
# Tab-like feature is similar to neighboring keys (e.g. ctrl-[, ctrl-^ on my keyboard, is mapped to
# Esc)
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=100%
    --border
    --preview-window 'hidden'
    --bind 'ctrl-]:toggle-preview'
"

# [[ Key bindings ]]
# `fzf` define 3 key bindings:
# - <Ctrl-T> to insert a file or directory path in the command line
# - <Ctrl-R> to insert a command from the command history
# - <Alt-C> to `cd` to a directory

# <Ctrl-T>
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"
export FZF_CTRL_T_DEFAULT_HEADER='Paste path in command line'
export FZF_CTRL_T_OPTS="
    --prompt '$FZF_FILE_PROMPT'
    --header '$FZF_CTRL_T_DEFAULT_HEADER'
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: \
        [[ {fzf:prompt} = \"$FZF_FILE_PROMPT\" ]] \
            && echo \"change-prompt($FZF_DIR_PROMPT)+reload($FZF_FD_DIR_COMMAND)+change-header($FZF_CTRL_T_DEFAULT_HEADER)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\" \
            || echo \"change-prompt($FZF_FILE_PROMPT)+reload($FZF_FD_FILE_COMMAND)+change-header($FZF_CTRL_T_DEFAULT_HEADER)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"'
    --bind 'ctrl-j:transform: \
        [[ {fzf:prompt} = \"$FZF_FILE_PROMPT\" ]] \
            && echo \"reload(eval $FZF_FD_FILE_COMMAND)+change-header($FZF_CTRL_T_DEFAULT_HEADER)\" \
            || echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-header($FZF_CTRL_T_DEFAULT_HEADER)\"'
    --bind 'ctrl-k:transform: \
        [[ {fzf:prompt} = \"$FZF_FILE_PROMPT\" ]] \
            && echo \"reload(eval $FZF_FD_FILE_COMMAND_HIDDEN)+change-header($FZF_CTRL_T_DEFAULT_HEADER (include hidden))\" \
            || echo \"reload(eval $FZF_FD_DIR_COMMAND_HIDDEN)+change-header($FZF_CTRL_T_DEFAULT_HEADER (include hidden))\"'
    --bind 'ctrl-l:transform: \
        [[ {fzf:prompt} = \"$FZF_FILE_PROMPT\" ]] \
            && echo \"reload(eval $FZF_FD_FILE_COMMAND_ALL)+change-header($FZF_CTRL_T_DEFAULT_HEADER (include hidden & ignored))\" \
            || echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-header($FZF_CTRL_T_DEFAULT_HEADER (include hidden & ignored))\"'
"

# <Ctrl-R>
export FZF_CTRL_R_OPTS="
    --prompt '$FZF_CMD_PROMPT'
    --header 'Past command in command line'
"

# <Alt-C>
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_DEFAULT_HEADER='Change directory'
export FZF_ALT_C_OPTS="
    --prompt '$FZF_DIR_PROMPT'
    --header '$FZF_ALT_C_DEFAULT_HEADER'
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-j:reload(eval $FZF_FD_DIR_COMMAND)+change-header($FZF_ALT_C_DEFAULT_HEADER)'
    --bind 'ctrl-k:reload(eval $FZF_FD_DIR_COMMAND_HIDDEN)+change-header($FZF_ALT_C_DEFAULT_HEADER (include hidden))'
    --bind 'ctrl-l:reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-header($FZF_ALT_C_DEFAULT_HEADER (include hidden & ignored))'
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
    selected_line=$(alias | fzf --prompt="$FZF_ALIAS_PROMPT" --header="Past alias in command line")

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
    selected_file=$(command ls "$ZSH_CUSTOM" | fzf --prompt="$FZF_FILE_PROMPT" --header="Edit an alias file")

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
    selected_theme=$(echo "$TERMINAL_THEMES" | fzf --prompt="$FZF_THEME_PROMPT" --header="Change terminal theme")

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
