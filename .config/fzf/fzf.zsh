# [[ Variables ]]

export FZF_FD_FILE_COMMAND='fd --type f'
export FZF_FD_FILE_COMMAND_HIDDEN='fd --type f --hidden'
export FZF_FD_FILE_COMMAND_IGNORED='fd --type f --no-ignore'
export FZF_FD_FILE_COMMAND_ALL='fd --type f --hidden --no-ignore --exclude .git'
export FZF_FD_DIR_COMMAND='fd --type d'
export FZF_FD_DIR_COMMAND_HIDDEN='fd --type d --hidden'
export FZF_FD_DIR_COMMAND_IGNORED='fd --type d --no-ignore'
export FZF_FD_DIR_COMMAND_ALL='fd --type d --hidden --no-ignore --exclude .git'

export FZF_PROMPT_FILE='Files > '
export FZF_PROMPT_FILE_HIDDEN='Files [h] > '
export FZF_PROMPT_FILE_IGNORE='Files [i] > '
export FZF_PROMPT_FILE_ALL='Files [i][h] > '
export FZF_PROMPT_DIR='Directories > '
export FZF_PROMPT_DIR_HIDDEN='Directories [h] > '
export FZF_PROMPT_DIR_IGNORE='Directories [i] > '
export FZF_PROMPT_DIR_ALL='Directories [i][h] > '
export FZF_PROMPT_COMMAND='Commands > '
export FZF_PROMPT_ALIAS='Aliases > '
export FZF_PROMPT_COMMIT='Commits > '

export FZF_PREVIEW_PATH='
if [[ -d {} ]]; then
    eza -a1 --color=always --icons=always --group-directories-first {}
elif [[ -f {} ]]; then
    bat --color=always --line-range=:500 {}
else
    echo "Unsupported preview: {}"
fi
'
export FZF_PREVIEW_COMMIT='git show --color=always {1}'

# [[ Options ]]

export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=40%
    --cycle # Cycle through the list when reaching the top/bottom
    --bind change:top # Move cursor to top on query change
    --bind 'tab:down'
    --bind 'shift-tab:up'
    --bind 'ctrl-s:toggle+down' # Like 'select'
    --bind 'ctrl-g:top' # Like the 'gg' keymap in Vim/Neovim
    --bind 'alt-p:toggle-preview'
"

export FZF_CTRL_T_COMMAND="$FZF_FD_FILE_COMMAND_HIDDEN"
export FZF_CTRL_T_TOGGLE_DIR_TRANSFORMER="
    if [[ {fzf:prompt} = \"$FZF_PROMPT_FILE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR)+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE)+reload($FZF_FD_FILE_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_HIDDEN)+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_HIDDEN)+reload($FZF_FD_FILE_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_IGNORE)+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_IGNORE)+reload($FZF_FD_FILE_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_ALL)+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_ALL)+reload($FZF_FD_FILE_COMMAND_ALL)\"
    fi
"
export FZF_CTRL_T_TOGGLE_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"$FZF_PROMPT_FILE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_HIDDEN)+reload($FZF_FD_FILE_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE)+reload($FZF_FD_FILE_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_HIDDEN)+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR)+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_ALL)+reload($FZF_FD_FILE_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_IGNORE)+reload($FZF_FD_FILE_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_ALL)+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_IGNORE)+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    fi
"
export FZF_CTRL_T_TOGGLE_IGNORED_TRANSFORMER="
    if [[ {fzf:prompt} = \"$FZF_PROMPT_FILE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_IGNORE)+reload($FZF_FD_FILE_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE)+reload($FZF_FD_FILE_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_IGNORE)+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR)+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_ALL)+reload($FZF_FD_FILE_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_FILE_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_FILE_HIDDEN)+reload($FZF_FD_FILE_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_ALL)+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_HIDDEN)+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    fi
"
export FZF_CTRL_T_OPTS="
    --prompt '$FZF_PROMPT_FILE_HIDDEN'
    --preview '$FZF_PREVIEW_PATH'
    --bind 'ctrl-t:transform: $FZF_CTRL_T_TOGGLE_DIR_TRANSFORMER'
    --bind 'alt-h:transform: $FZF_CTRL_T_TOGGLE_HIDDEN_TRANSFORMER'
    --bind 'alt-i:transform: $FZF_CTRL_T_TOGGLE_IGNORED_TRANSFORMER'
"

export FZF_CTRL_R_OPTS="
    --prompt '$FZF_PROMPT_COMMAND'
"

export FZF_ALT_C_COMMAND="$FZF_FD_DIR_COMMAND_HIDDEN"
export FZF_ALT_C_TOGGLE_HIDDEN_TRANSFORMER="
    if [[ {fzf:prompt} = \"$FZF_PROMPT_DIR\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_HIDDEN)+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR)+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_ALL)+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_IGNORE)+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    fi
"
export FZF_ALT_C_TOGGLE_IGNORED_TRANSFORMER="
    if [[ {fzf:prompt} = \"$FZF_PROMPT_DIR\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_IGNORE)+reload($FZF_FD_DIR_COMMAND_IGNORED)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_IGNORE\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR)+reload($FZF_FD_DIR_COMMAND)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_HIDDEN\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_ALL)+reload($FZF_FD_DIR_COMMAND_ALL)\"
    elif [[ {fzf:prompt} = \"$FZF_PROMPT_DIR_ALL\" ]]; then
        echo \"change-prompt($FZF_PROMPT_DIR_HIDDEN)+reload($FZF_FD_DIR_COMMAND_HIDDEN)\"
    fi
"
export FZF_ALT_C_OPTS="
    --prompt '$FZF_PROMPT_DIR_HIDDEN'
    --preview '$FZF_PREVIEW_PATH'
    --bind 'alt-h:transform: $FZF_ALT_C_TOGGLE_HIDDEN_TRANSFORMER'
    --bind 'alt-i:transform: $FZF_ALT_C_TOGGLE_IGNORED_TRANSFORMER'
"

# [[ Keybindings ]]

function _fzf-alias-widget() {
    local selected_alias=$(alias |
        sed 's/=/ -> /' |
        fzf --prompt "$FZF_PROMPT_ALIAS" |
        cut -d' ' -f1)
    if [[ -n "$selected_alias" ]]; then
        LBUFFER="${LBUFFER}${selected_alias} "
    fi
    zle reset-prompt
}
zle -N _fzf-alias-widget
bindkey '^[r' _fzf-alias-widget # <M-r>

function _fzf-git-log-widget() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        zle -M "Not a git repository"
        return 1
    fi
    local commits=$(git log --oneline --color=always |
        fzf --ansi --no-sort --multi --prompt "$FZF_PROMPT_COMMIT" --preview "$FZF_PREVIEW_COMMIT" |
        awk '{print $1}')
    if [[ -n "$commits" ]]; then
        local commit_string=$(echo "$commits" | tr '\n' ' ' | sed 's/ $//')
        LBUFFER="${LBUFFER}${commit_string}"
    fi
    zle reset-prompt
}
zle -N _fzf-git-log-widget
bindkey '^[t' _fzf-git-log-widget # <M-t>

# [[ Completion ]]

export FZF_COMPLETION_TRIGGER='' # Remove the default trigger character
bindkey '^[[Z' fzf-completion    # Use <S-Tab> as fzf completion keybinding (<Tab> is kept for regular completion)

# Use `fd` to generate completion candidates (doesn't respect the `ignore` file here)
# In the following functions, `$1` is the base path to start traversal
_fzf_compgen_path() {
    fd --hidden --follow --strip-cwd-prefix "$1"
}
_fzf_compgen_dir() {
    fd --hidden --follow --strip-cwd-prefix --type d "$1"
}

# Use same preview for all commands
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    *) fzf --preview "$FZF_PREVIEW_PATH" "$@" ;;
    esac
}

# Specify commands which trigger directory-only completion (builtin commands whose default completion shows only directories)
export FZF_COMPLETION_DIR_COMMANDS='
    cd
'

# [[ Setup ]]

# Set up shell integration (key bindings & fuzzy completion)
source <(fzf --zsh)

# Since above is defined a custom keybinding for completion, remapping <C-i> is necessary to keep it as regular completion
# shellcheck disable=SC2154
bindkey '^i' "$fzf_default_completion"
