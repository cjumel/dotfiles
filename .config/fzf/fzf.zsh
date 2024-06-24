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

# General options (keymaps below are defined to be the same as the ones defined in the telescope.nvim)
export FZF_DEFAULT_COMMAND="$FZF_FD_COMMAND"
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=40%
    --bind 'tab:down'
    --bind 'shift-tab:up'
    --bind 'ctrl-]:toggle-preview'
    --bind 'ctrl-s:toggle+down'
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
export FZF_CTRL_T_OPTS="
    --prompt 'File > '
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_TRANSFORMER'
    --bind 'ctrl-\\:transform: $FZF_CTRL_T_ALL_TRANSFORMER'
"

# <C-r>: insert a command from the command history in the command line
export FZF_CTRL_R_OPTS="
    --prompt 'Command > '
"

# <M-c>: `cd` into a directory
bindkey "©" fzf-cd-widget # Actually enable the <M-c> key binding (alt mappings are not directly available on my system)
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_ALL_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND_ALL)+change-prompt(Directory (all) > )\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"reload(eval $FZF_FD_DIR_COMMAND)+change-prompt(Directory > )\"
    fi
"
export FZF_ALT_C_OPTS="
    --prompt 'Directory > '
    --preview '$FZF_DIR_PREVIEW'
    --bind 'ctrl-\\:transform: $FZF_ALT_C_ALL_TRANSFORMER'
"

# [[ Completion ]]
# fzf completion is triggered by using specific characters (`**` by default) and <Tab>, or directly with a keybinding.
#   It is contextual, in some cases it can detect whether a file or a directory is expected.

export FZF_COMPLETION_TRIGGER='' # Remove the default trigger character
bindkey '^[[Z' fzf-completion    # Use <S-Tab> as fzf completion keybinding (<Tab> is kept for regular completion)

# Use fd to generate completion candidates
#   In this use case, fd doesn't respect the `ignore` file
#   In the following functions, `$1` is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --hidden --follow --type d . "$1"
}

# Enable the preview when using fzf with `cd` or `c` (aliased to `cd`)
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
    cpr
    du
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

# Since above is defined a custom keybinding for completion, remapping <C-i> is necessary to keep it as regular completion
# shellcheck disable=SC2154
bindkey '^i' "$fzf_default_completion"
