# [[ General options ]]

# Source commands
export FZF_FD_COMMAND='fd --hidden .'
export FZF_FD_COMMAND_ALL='fd --hidden --no-ignore --exclude .git .'
export FZF_FD_FILE_COMMAND='fd --type f --hidden .'
export FZF_FD_FILE_COMMAND_ALL='fd --type f --hidden --no-ignore --exclude .git .'
export FZF_FD_DIR_COMMAND='fd --type d --hidden .'
export FZF_FD_DIR_COMMAND_ALL='fd --type d --hidden --no-ignore --exclude .git .'

# Previewers (escaped versions are necessary for transform actions)
export FZF_FILE_PREVIEW='bat --color=always --line-range=:500 {}'
export FZF_FILE_PREVIEW_ESCAPED='bat --color=always --line-range=:500 \{}'
export FZF_DIR_PREVIEW='eza -a1 --color=always {}'
export FZF_DIR_PREVIEW_ESCAPED='eza -a1 --color=always \{}'

# General options
export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND"
# <Ctrl-g> is chosen for "go to top", like (Neo)vim's `gg`
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=50%
    --border
    --bind 'ctrl-i:toggle-preview'
    --bind 'ctrl-g:top'
"

# [[ Key bindings ]]
# `fzf` define 3 key bindings:
# - <Ctrl-T> to insert a file or directory path in the command line
# - <Ctrl-R> to insert a command from the command history
# - <Alt-C> to `cd` to a directory

# Enable <Alt-C> keymap (alt mappings are not available on my system)
bindkey "©" fzf-cd-widget

# <Ctrl-T>
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"
export FZF_CTRL_T_TOGGLE_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(File (all) > )+reload($FZF_FD_FILE_COMMAND_ALL)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    fi
"
export FZF_CTRL_T_ALL_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND_ALL)+change-prompt(File (all) > )\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (all) > )\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"reload(eval $FZF_FD_FILE_COMMAND)+change-prompt(File > )\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"

# <Ctrl-]> corresponds to <Ctrl-$> on my keyboard
export FZF_CTRL_T_OPTS="
    --prompt 'File > '
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_TRANSFORMER'
    --bind 'ctrl-]:transform: $FZF_CTRL_T_ALL_TRANSFORMER'
"

# <Ctrl-R>
export FZF_CTRL_R_OPTS="
    --prompt 'Command > '
"

# <Alt-C>
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_ALL_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (all) > )\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"

# <Ctrl-]> corresponds to <Ctrl-$> on my keyboard
export FZF_ALT_C_OPTS="
    --prompt 'Directory > '
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-]:transform: $FZF_ALT_C_ALL_TRANSFORMER'
"

# [[ Completion ]]
# Completion is contextual: in some cases it can detect whether a file or a directory is expected
# Completion is triggered by using specific characters (`**` by default) and then <Tab>, or directly with a keybinding

# Let's define a keybinding to trigger completion instead of trigger characters
# I use <Tab> for completion with `fzf-tab`, let's use <S-Tab> for `fzf` completion
export FZF_COMPLETION_TRIGGER=''
bindkey '^[[Z' fzf-completion

# Use `fd` to generate completion candidates (in this use case, `fd` doesn't respect the `ignore` file)
# In the following functions, `$1` is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --hidden --follow --type d . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    c) fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
    cd) fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
    *) fzf "$@" ;;
    esac
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
    rmr
    rmrf
    to
    touch
'

# [[ Setup ]]

# Set up shell integration (key bindings & fuzzy completion)
source <(fzf --zsh)

# Since above is defined a custom keybinding for completion, remapping `^I` is necessary to keep it as regular completion
# shellcheck disable=SC2154
bindkey '^i' "$fzf_default_completion"

# [[ Theme features ]]
# Manage themes for WezTerm, Tmux, and Neovim at the same time

# List all themes available (default one then in alphabetical order)
TERMINAL_THEMES='catppuccin-mocha
catppuccin-frappe
catppuccin-macchiato
catppuccin-latte
gruvbox-dark
gruvbox-light
kanagawa-dragon
kanagawa-lotus
kanagawa-wave
rose-pine-dawn
rose-pine-main
rose-pine-moon
tokyonight-day
tokyonight-moon
tokyonight-night
tokyonight-storm'

# Pick a theme with fzf and set it up by creating the relevant symlinks
function theme_fzf_picker() {
    # Make the user select a theme using fzf among the available ones
    selected_theme=$(echo "$TERMINAL_THEMES" | fzf --prompt="Theme > ")

    # Exit if no theme is selected, to avoid creating broken symlinks
    if [[ -z $selected_theme ]]; then
        return
    fi

    # Create symlinks to the selected theme (overwrite existing ones)
    ln -sf ~/.config/wezterm/theme/"$selected_theme".lua ~/.config/wezterm/theme/current.lua
    ln -sf ~/.config/tmux/theme/"$selected_theme"/tmux-pre-tpm.conf ~/.config/tmux/theme/tmux-pre-tpm.conf
    ln -sf ~/.config/tmux/theme/"$selected_theme"/tmux-post-tpm.conf ~/.config/tmux/theme/tmux-post-tpm.conf
    ln -sf ~/.config/nvim/lua/theme/"$selected_theme".lua ~/.config/nvim/lua/theme/current.lua
}

alias ct='theme_fzf_picker' # Change theme
