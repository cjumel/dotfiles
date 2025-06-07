# [[ General options ]]

# Source commands
export FZF_FD_FILE_COMMAND='fd --type f .'
export FZF_FD_FILE_COMMAND_HIDDEN='fd --type f --hidden .'
export FZF_FD_FILE_COMMAND_IGNORED='fd --type f --no-ignore .'
export FZF_FD_FILE_COMMAND_ALL='fd --type f --hidden --no-ignore --exclude .git .'
export FZF_FD_DIR_COMMAND='fd --type d .'
export FZF_FD_DIR_COMMAND_HIDDEN='fd --type d --hidden .'
export FZF_FD_DIR_COMMAND_IGNORED='fd --type d --no-ignore .'
export FZF_FD_DIR_COMMAND_ALL='fd --type d --hidden --no-ignore --exclude .git .'

# Previewers (escaped versions are necessary for the transform actions below)
export FZF_EZA_PREVIEW='eza -a1 --color=always --icons=always --group-directories-first {}'
export FZF_EZA_PREVIEW_ESCAPED='eza -a1 --color=always --icons=always --group-directories-first \{}'
export FZF_BAT_PREVIEW='bat --color=always --line-range=:500 {}'
export FZF_BAT_PREVIEW_ESCAPED='bat --color=always --line-range=:500 \{}'
export FZF_FILE_PREVIEW="$FZF_BAT_PREVIEW"
export FZF_FILE_PREVIEW_ESCAPED="$FZF_BAT_PREVIEW_ESCAPED"
export FZF_DIR_PREVIEW="$FZF_EZA_PREVIEW"
export FZF_DIR_PREVIEW_ESCAPED="$FZF_EZA_PREVIEW_ESCAPED"

# General options
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=40%
    --bind 'tab:down'
    --bind 'shift-tab:up'
    --bind 'ctrl-s:toggle+down'
    --bind 'ctrl-g:top'
    --bind 'ctrl-^:forward-word'  # <C-,>
    --bind 'ctrl-_:backward-word' # <C-;>
    --bind 'π:toggle-preview'     # <M-p>
"

# [[ Key bindings ]]
# fzf defines by default 3 key bindings for zsh: <C-t>, <C-r> and <M-c>.

# <C-t>: insert a file or directory path in the command line
export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND"
export FZF_CTRL_T_TOGGLE_DIR_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (hidden) > \" ]]; then
        echo \"change-prompt(Directory (hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (hidden) > \" ]]; then
        echo \"change-prompt(File (hidden) > )+reload($FZF_FD_FILE_COMMAND_HIDDEN)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (ignored) > \" ]]; then
        echo \"change-prompt(Directory (ignored) > )+reload($FZF_FD_DIR_COMMAND_IGNORED)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (ignored) > \" ]]; then
        echo \"change-prompt(File (ignored) > )+reload($FZF_FD_FILE_COMMAND_IGNORED)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)+change-preview($FZF_DIR_PREVIEW_ESCAPED)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(File (all) > )+reload($FZF_FD_FILE_COMMAND_ALL)+change-preview($FZF_FILE_PREVIEW_ESCAPED)\"
    fi
"
export FZF_CTRL_T_TOGGLE_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(File (hidden) > )+reload($FZF_FD_FILE_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"File (hidden) > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(Directory (hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"Directory (hidden) > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"File (ignored) > \" ]]; then
        echo \"change-prompt(File (all) > )+reload($FZF_FD_FILE_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"change-prompt(File (ignored) > )+reload($FZF_FD_FILE_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"Directory (ignored) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(Directory (ignored) > )+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    fi
"
export FZF_CTRL_T_TOGGLE_IGNORED_TRANSFORMER="
    if [[ {fzf:prompt} = \"File > \" ]]; then
        echo \"change-prompt(File (ignored) > )+reload($FZF_FD_FILE_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"File (ignored) > \" ]]; then
        echo \"change-prompt(File > )+reload($FZF_FD_FILE_COMMAND)\"
    elif [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(Directory (ignored) > )+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"Directory (ignored) > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"File (hidden) > \" ]]; then
        echo \"change-prompt(File (all) > )+reload($FZF_FD_FILE_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"File (all) > \" ]]; then
        echo \"change-prompt(File (hidden) > )+reload($FZF_FD_FILE_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"Directory (hidden) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(Directory (hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    fi
"
export FZF_CTRL_T_OPTS="
    --prompt 'File > '
    --preview '$FZF_FILE_PREVIEW'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_DIR_TRANSFORMER'
    --bind 'Ì:transform: $FZF_CTRL_T_TOGGLE_HIDDEN_TRANSFORMER'  # <M-h>
    --bind 'î:transform: $FZF_CTRL_T_TOGGLE_IGNORED_TRANSFORMER' # <M-i>
"

# <C-r>: insert a command from the command history in the command line
export FZF_CTRL_R_OPTS="
    --prompt 'Command > '
"

# <M-c>: `cd` into a directory
bindkey "©" fzf-cd-widget # Actually enable the <M-c> key binding
export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND"
export FZF_ALT_C_TOGGLE_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(Directory (hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"Directory (hidden) > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"Directory (ignored) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(Directory (ignored) > )+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    fi
"
export FZF_ALT_C_TOGGLE_IGNORED_TRANSFORMER="
    if [[ {fzf:prompt} = \"Directory > \" ]]; then
        echo \"change-prompt(Directory (ignored) > )+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"Directory (ignored) > \" ]]; then
        echo \"change-prompt(Directory > )+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"Directory (hidden) > \" ]]; then
        echo \"change-prompt(Directory (all) > )+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"Directory (all) > \" ]]; then
        echo \"change-prompt(Directory (hidden) > )+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    fi
"
export FZF_ALT_C_OPTS="
    --prompt 'Directory > '
    --preview '$FZF_DIR_PREVIEW'
    --bind 'Ì:transform: $FZF_ALT_C_TOGGLE_HIDDEN_TRANSFORMER'  # <M-h>
    --bind 'î:transform: $FZF_ALT_C_TOGGLE_IGNORED_TRANSFORMER' # <M-i>
"

# [[ Completion ]]
# `fzf` completion is triggered by entering specific characters (`**` by default) and <Tab>. It is contextual, in some
# cases it can detect what type of items are expected (e.g. files or directories).

export FZF_COMPLETION_TRIGGER='' # Remove the default trigger character
bindkey '^[[Z' fzf-completion    # Use <S-Tab> as fzf completion keybinding (<Tab> is kept for regular completion)

# Use `fd` to generate completion candidates (doesn't respect the `ignore` file here)
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
