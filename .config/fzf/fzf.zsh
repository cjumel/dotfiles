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
# ctrl-g is chosen for "go to top", like (Neo)vim's `gg`
# ctrl-] is actually ctrl-$ on my keyboard; rationale for this binding is that mapping it to a
# Tab-like feature is similar to neighboring keys (e.g. ctrl-[, ctrl-^ on my keyboard, is mapped to
# Esc)
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=50%
    --border
    --preview-window 'hidden'
    --bind 'ctrl-g:top'
    --bind 'ctrl-]:toggle-preview'
"

# [[ Key bindings ]]
# `fzf` define 3 key bindings:
# - <Ctrl-T> to insert a file or directory path in the command line
# - <Ctrl-R> to insert a command from the command history
# - <Alt-C> to `cd` to a directory

# <Ctrl-T>
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"

export FZF_CTRL_T_TOGGLE_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (w/ hidden) > \" ]]; then
        echo \"change-prompt(Directory (w/ hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (w/ hidden & ignored) > \" ]]; then
        echo \"change-prompt(Directory (w/ hidden & ignored) > )+reload($FZF_FD_DIR_COMMAND_ALL)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden) > \" ]]; then
        echo \"change-prompt(File (w/ hidden) > )+reload($FZF_FD_FILE_COMMAND_HIDDEN)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden & ignored) > \" ]]; then
        echo \"change-prompt(File (w/ hidden & ignored) > )+reload($FZF_FD_FILE_COMMAND_ALL)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    fi
"
export FZF_CTRL_T_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]] || [[ {fzf:prompt} = \"File (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND_HIDDEN)+change-prompt(File (w/ hidden) > )\"
    elif [[ {fzf:prompt} = \"Directory > \" ]] || [[ {fzf:prompt} = \"Directory (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_HIDDEN)+change-prompt(Directory (w/ hidden) > )\"
    elif [[ {fzf:prompt} = \"File (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND)+change-prompt(File > )\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"
export FZF_CTRL_T_ALL_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]] || [[ {fzf:prompt} = \"File (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND_ALL)+change-prompt(File (w/ hidden & ignored) > )\"
    elif [[ {fzf:prompt} = \"Directory > \" ]] || [[ {fzf:prompt} = \"Directory (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (w/ hidden & ignored) > )\"
    elif [[ {fzf:prompt} = \"File (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND)+change-prompt(File > )\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"

export FZF_CTRL_T_OPTS="
    --prompt '$FZF_FILE_PROMPT'
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_TRANSFORMER'
    --bind 'ctrl-^:transform: $FZF_CTRL_T_HIDDEN_TRANSFORMER'
    --bind 'ctrl-_:transform: $FZF_CTRL_T_ALL_TRANSFORMER'
"

# <Ctrl-R>
export FZF_CTRL_R_OPTS="
    --prompt '$FZF_CMD_PROMPT'
"

# <Alt-C>
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"

export FZF_ALT_C_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]] || [[ {fzf:prompt} = \"Directory (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_HIDDEN)+change-prompt(Directory (w/ hidden) > )\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"
export FZF_ALT_C_HIDDEN_AND_IGNORE_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]] || [[ {fzf:prompt} = \"Directory (w/ hidden) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (w/ hidden & ignored) > )\"
    elif [[ {fzf:prompt} = \"Directory (w/ hidden & ignored) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"

export FZF_ALT_C_OPTS="
    --prompt '$FZF_DIR_PROMPT'
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-^:transform: $FZF_ALT_C_HIDDEN_TRANSFORMER'
    --bind 'ctrl-_:transform: $FZF_ALT_C_HIDDEN_AND_IGNORE_TRANSFORMER'
"

# [[ Completion ]]
# `fzf` triggers command line completion by entering trigger characters and then <Tab> or <Ctrl-I>
# or directly by entering a fuzzy completion keybinding
# Completion is contextual, that is in some cases it can detect wether a file or a directory is
# expected for instance.

# Default trigger is `**` as completion trigger characters
# Let's change it to no completion trigger to define a fuzzy completion keybinding below (must
# be done after sourcing the fuzzy auto-completion script)
export FZF_COMPLETION_TRIGGER=''

# Use `fd` to generate completion candidates
# In the following functions, `$1` is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --hidden --follow --type d . "$1"
}

# Specify the commands which trigger directory completion for fzf
export FZF_COMPLETION_DIR_COMMANDS='
    c
    cd
    du
    l
    la
    ls
    lsa
    md
    mdp
    mkdir
    rm -r
    rm -rf
    rmr
    rmrf
    to
    touch
'

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

# Define fuzzy auto-completion keybindings
# By default, '^O' is equivalent to '^M' or '<CR>', and it's next to '^I', the regular completion key
# Re-mapping '^I' is necessary to keep it as regular completion
bindkey '^O' fzf-completion
bindkey '^I' $fzf_default_completion

# [[ Alias features ]]

# Use fzf to fuzzy search aliases and paste the selected one to the command line
function alias_fzf_search() {
    selected_line=$(alias | fzf --prompt="$FZF_ALIAS_PROMPT")

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
    selected_file=$(command ls "$ZSH_CUSTOM" | fzf --prompt="$FZF_FILE_PROMPT")

    # Exit if nothing is selected
    if [[ -z $selected_file ]]; then
        return
    fi

    vi "$ZSH_CUSTOM/$selected_file"
}

alias als='alias_fzf_search'
alias ale='alias_fzf_edit'

# [[ Theme features ]]
# Manage themes for WezTerm, Tmux, and Neovim at the same time

TERMINAL_THEMES='catppuccin-frappe
catppuccin-macchiato
catppuccin-mocha
catppuccin-latte
dracula
gruvbox-dark
gruvbox-light
kanagawa
nord
onedark
rose-pine
rose-pine-dawn
rose-pine-moon
tokyonight'

# Pick a theme with fzf and set it up by creating the relevant symlinks
function theme_fzf_picker() {
    # Make the user select a theme using fzf among the available ones
    selected_theme=$(echo "$TERMINAL_THEMES" | fzf --prompt="$FZF_THEME_PROMPT")

    # Exit if no theme is selected, to avoid creating broken symlinks
    if [[ -z $selected_theme ]]; then
        return
    fi

    # Create symlinks to the selected theme (overwrite existing ones)
    ln -sf ~/.config/wezterm/themes/"$selected_theme".lua ~/.config/wezterm/theme.lua
    ln -sf ~/.config/tmux/themes/tmux-"$selected_theme".conf ~/.config/tmux/tmux-theme.conf
    ln -sf ~/.config/tmux/themes/tmux-"$selected_theme"-post.conf ~/.config/tmux/tmux-theme-post.conf
    ln -sf ~/.config/nvim/lua/themes/"$selected_theme".lua ~/.config/nvim/lua/theme.lua
}

alias ct='theme_fzf_picker' # Change theme
