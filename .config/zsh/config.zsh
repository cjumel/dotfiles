# shellcheck disable=SC2034

# [[ Options ]]
# This should be sourced at the beginning of the configuration

eval "$(brew shellenv)"               # Homebrew post-installation: set HOMEBREW_PREFIX, update PATH, MANPATH, fpath (for shell completions), etc.
fpath=("${fpath[@]:1}" "${fpath[1]}") # Move prepended Homebrew's fpath to the end (some of Homebrew's completions are worse than the default ones, e.g. for `git`)

export PATH="$PATH:$HOME/.local/bin" # Append to PATH directory for manual (e.g. neovim) or some tools (e.g. uv) binaries, this must not be prepended to avoid overriding Homebrew Python binaries

export LANG=en_US.UTF-8 # Set the default language
export EDITOR=nvim      # Set the default editor
export VISUAL=nvim      # Set the default visual editor
export PAGER=less       # Set the default pager
export LESS=R           # Options for less (clear terminal content after quiting)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Set case-insensitive completion when using lowercase (like ripgrep smart case)

HISTFILE="$HOME/.zsh_history" # History file location
HISTSIZE=10000                # Limit number of entries in memory
SAVEHIST=10000                # Limit number of entries in history file
HISTDUP=erase                 # Erase duplicates in the history file
setopt APPEND_HISTORY         # Append commands to history file instead of replacing it
setopt HIST_IGNORE_ALL_DUPS   # If a new command in history list duplicates an older one, the latter is removed
setopt HIST_IGNORE_DUPS       # if a new command in history list duplicates the previous one, the former is ignored
setopt HIST_IGNORE_SPACE      # Do not record a command starting with a space; convenient for sensible commands
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks & newlines from commands; help prevent duplicates & improve fuzzy search in commands
setopt HIST_SAVE_NO_DUPS      # Do not save any older duplicate command to the history file
setopt SHARE_HISTORY          # Enable sharing history between sessions by adding & importing entries incrementally; replace `INC_APPEND_HISTORY`

# [[ Key bindings ]]

bindkey -e # Force emacs keybindings for zsh (usually the default but setting `EDITOR` to `nvim` alter this setting)

bindkey "^o" clear-screen # By default, clear-screen is mapped to <C-l>, but this keymap is used for window navigation in Tmux
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

insert-newline() {
    LBUFFER="${LBUFFER}
"
}
zle -N insert-newline
bindkey '^[[13;2u' insert-newline # <S-CR>

autoload edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line # Mnemonic: Vim

# [[ Python setup ]]

alias python='python3'

function activate_python_venv_hook() {
    if [[ -f "$PWD/.venv/bin/activate" ]]; then
        if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then # A different venv is enabled or no venv is enabled
            [[ -n "$VIRTUAL_ENV" ]] && deactivate
            VIRTUAL_ENV_DISABLE_PROMPT=1 source "$PWD/.venv/bin/activate" # Don't alter the prompt to avoid disabling it entirely when using `deactivate` in a tmux session
        fi
    elif [[ -n "$VIRTUAL_ENV" && "$PWD" != "${VIRTUAL_ENV%/*}"* ]]; then # A venv is enabled and we are no longer in its directory or subdirectories
        deactivate
    fi
}

add-zsh-hook chpwd activate_python_venv_hook # On directory change
activate_python_venv_hook                    # On shell startup
