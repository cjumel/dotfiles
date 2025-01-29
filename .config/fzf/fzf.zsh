# [[ General options ]]

# Source commands
export FZF_FD_COMMAND='fd --hidden .'
export FZF_FD_COMMAND_ALL='fd --hidden --no-ignore --exclude .git .'
export FZF_FD_FILE_COMMAND='fd --type f --hidden .'
export FZF_FD_FILE_COMMAND_ALL='fd --type f --hidden --no-ignore --exclude .git .'
export FZF_FD_DIR_COMMAND='fd --type d --hidden .'
export FZF_FD_DIR_COMMAND_ALL='fd --type d --hidden --no-ignore --exclude .git .'

# Previewers (escaped versions are necessary for the transform actions used below)
# We could use `cat` or `bat` for file preview, to view the content of the file in the preview, with:
#   - `export FZF_FILE_PREVIEW='bat --color=always --line-range=:500 {}'`
#   - `export FZF_FILE_PREVIEW_ESCAPED='bat --color=always --line-range=:500 \{}'`
# Since `bat` will display an error when used on a directory, and there aren't many cases we know for sure only files
# will be suggested (only with the <C-t> keymap when looking for files), I prefer to stick with `eza` (used for the
# directory preview) for the file preview as well. That way, all preview related to file and directories will be done
# with `eza`.
export FZF_FILE_PREVIEW='eza -a1 --color=always --icons=always --group-directories-first {}'
export FZF_FILE_PREVIEW_ESCAPED='eza -a1 --color=always --icons=always --group-directories-first \{}'
export FZF_DIR_PREVIEW='eza -a1 --color=always --icons=always --group-directories-first {}'
export FZF_DIR_PREVIEW_ESCAPED='eza -a1 --color=always --icons=always --group-directories-first \{}'

# General options (keymaps below are defined to be the same as the ones defined in the telescope.nvim). In these
# keymaps, we reserve <C-t> for a command-specific toggle action.
export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND"
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=40%
    --bind 'ctrl-s:toggle+down'
    --bind 'tab:down'
    --bind 'shift-tab:up'
    --bind 'ctrl-v:toggle-preview'
    --bind 'ctrl-g:top'
    --bind 'ctrl-^:forward-word'
    --bind 'ctrl-_:backward-word'
"

# [[ Key bindings ]]
# fzf defines 3 key bindings for zsh which are configured in this section & actually setup in the "Setup" section

# <C-t>: insert a file or directory path in the command line
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"
export FZF_CTRL_T_TOGGLE_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(File (all) > )+reload($FZF_FD_FILE_COMMAND_ALL)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    fi
"
export FZF_CTRL_T_OPTS="
    --prompt 'File > '
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_TRANSFORMER'
"

# <C-r>: insert a command from the command history in the command line
export FZF_CTRL_R_OPTS="
    --prompt 'Command > '
"

# <M-c>: `cd` into a directory
bindkey "©" fzf-cd-widget # Actually enable the <M-c> key binding (alt mappings are not directly available on my system)
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_TOGGLE_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (all) > )\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"
export FZF_ALT_C_OPTS="
    --prompt 'Directory > '
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_ALT_C_TOGGLE_TRANSFORMER'
"

# [[ Completion ]]
# `fzf` completion is triggered by entering specific characters (`**` by default) and <Tab>, or directly with a
# keybinding. It is contextual, in some cases it can detect whether directories are expected or both files and
# directories.

export FZF_COMPLETION_TRIGGER='' # Remove the default trigger character
bindkey '^[[Z' fzf-completion    # Use <S-Tab> as fzf completion keybinding (<Tab> is kept for regular completion)

# Use `fd` to generate completion candidates
# Here, `fd` doesn't respect the `ignore` file
# In the following functions, `$1` is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --hidden --follow --type d . "$1"
}

# Enable directory preview (with `eza`) for all `fzf` completion commands, as `fzf` completion only suggests results of
# `fd`, so only files and directories, in which case `eza` is always somehow useful
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    *) fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
    esac
}

# Specify the commands which trigger directory-only completion for `fzf`
# Let's enable this feature for the main builtin command aliases which only accept directories
export FZF_COMPLETION_DIR_COMMANDS='
    c
    cd
    cpr
    l
    la
    ll
    lla
    ls
    lt
    lta
    rmr
    rmrf
'

# [[ Setup ]]

# Set up shell integration (key bindings & fuzzy completion)
source <(fzf --zsh)

# Since above is defined a custom keybinding for completion, remapping <C-i> is necessary to keep it as regular
# completion
# shellcheck disable=SC2154
bindkey '^i' "$fzf_default_completion"
