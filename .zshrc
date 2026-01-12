# [[ Options ]]
# This should be at the top of the configuration

eval "$(brew shellenv)"               # Homebrew post-install: set `HOMEBREW_PREFIX`, update `PATH`, `MANPATH`, `fpath`, etc.
fpath=("${fpath[@]:1}" "${fpath[1]}") # Move prepended Homebrew's `fpath` to the end (some completions are worse than the default ones, e.g. for Git)

export PATH="$PATH:$HOME/.local/bin" # Append to `PATH` directory for manual (e.g. Neovim) or some tools (e.g. Poetry and uv) binaries, this must not be prepended to avoid overriding Homebrew Python binaries

export LANG=en_US.UTF-8 # Default language
export EDITOR=nvim      # Default editor
export VISUAL=nvim      # Default visual editor
export PAGER=less       # Default pager
export LESS=R           # Options for less (clear terminal content after quiting)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Set case-insensitive completion when using lowercase (like ripgrep's smart case)

HISTFILE="$HOME/.zsh_history" # History file location
HISTSIZE=10000                # Limit number of entries in memory
SAVEHIST=10000                # Limit number of entries in history file
HISTDUP=erase                 # Erase duplicates in the history file

setopt APPEND_HISTORY       # Append commands to history file instead of replacing it
setopt HIST_IGNORE_ALL_DUPS # If a new command in history list duplicates an older one, the latter is removed
setopt HIST_IGNORE_DUPS     # if a new command in history list duplicates the previous one, the former is ignored
setopt HIST_IGNORE_SPACE    # Do not record a command starting with a space; convenient for sensible commands
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks & newlines from commands; help prevent duplicates & improve fuzzy search in commands
setopt HIST_SAVE_NO_DUPS    # Do not save any older duplicate command to the history file
setopt SHARE_HISTORY        # Enable sharing history between sessions by adding & importing entries incrementally; replace `INC_APPEND_HISTORY`

bindkey -e # Force emacs keybindings (it is usually the default, but setting `EDITOR` to `nvim` alters this setting); this must be set before setting up the completion engine

# [[ Plugins ]]

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" # Directory where zinit & its plugins are stored
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# shellcheck disable=SC2016
export FZF_TAB_PREVIEW='
if [[ -d $realpath ]]; then
    eza -a1 --color=always --icons=always --group-directories-first $realpath
elif [[ -f $realpath ]]; then
    bat --color=always --line-range=:500 $realpath
elif [[ $word != HEAD && $word != */HEAD ]] && { git show-ref --verify --quiet refs/heads/$word 2>/dev/null || git show-ref --verify --quiet refs/remotes/$word 2>/dev/null || git show-ref --verify --quiet refs/remotes/origin/$word 2>/dev/null; }; then
    git log --oneline --color=always $word
elif git rev-parse --verify --quiet $word^{commit} >/dev/null 2>&1; then
    git show --color=always $word
else
    echo $desc | fold -s -w $FZF_PREVIEW_COLUMNS
fi
'
# shellcheck disable=SC2016
export FZF_TAB_ACTION_VIEW='execute({_FTB_INIT_}
if [[ -d $realpath ]]; then
    eza -a1 --color=always --icons=never --group-directories-first $realpath | less
elif [[ -f $realpath ]]; then
    bat --color=always $realpath | less
elif [[ $word != HEAD && $word != */HEAD ]] && { git show-ref --verify --quiet refs/heads/$word 2>/dev/null || git show-ref --verify --quiet refs/remotes/$word 2>/dev/null || git show-ref --verify --quiet refs/remotes/origin/$word 2>/dev/null; }; then
    git log --oneline --color=always $word | less
elif git rev-parse --verify --quiet $word^{commit} >/dev/null 2>&1; then
    git show --color=always $word | less
else
    echo $desc | fold -s -w $FZF_PREVIEW_COLUMNS | less
fi
)'

zinit light Aloxaf/fzf-tab     # Should be loaded before zsh-autosuggestions
zstyle ':completion:*' menu no # Avoid conflicts with fzf-tab
zstyle ':fzf-tab:*' fzf-flags \
    --height=40% \
    --bind 'alt-u:kill-line' \
    --bind 'ctrl-s:toggle+down' \
    --bind 'ctrl-g:top' \
    --bind 'alt-p:toggle-preview'
zstyle ':fzf-tab:complete:*' fzf-preview "$FZF_TAB_PREVIEW"
zstyle ':fzf-tab:complete:*' fzf-bindings "ctrl-v:$FZF_TAB_ACTION_VIEW"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# [[ Completion engine ]]

fpath+=("$HOME/.zfunc") # Directory for manual completion scripts
autoload -Uz compinit
# Only check the cache once a day, to reduce startup time; to manually refresh cache, run `rm -f ~/.zcompdump`
if [[ ! -f "$HOME/.zcompdump" ]] || [[ "$(find "$HOME/.zcompdump" -mtime +1)" ]]; then
    compinit
else
    compinit -C # Skip security checks and re-use cache if it exists
fi
zinit cdreplay -q # Actually run any compdef saved by zinit before compinit call

# [[ Key bindings ]]
# Existing key bindings can be seen with the `bindkey` command

insert-newline() {
    LBUFFER="${LBUFFER}
"
}
zle -N insert-newline
autoload edit-command-line
zle -N edit-command-line
copy-command-line() {
    # shellcheck disable=SC2153
    echo -n "$BUFFER" | pbcopy
    zle -M "Command copied to clipboard"
}
zle -N copy-command-line

bindkey '^[[13;2u' insert-newline # <S-CR>
bindkey "^[l" clear-screen        # `clear-screen` default keymap ("^l") is overriden by tmux window navigation
bindkey "^u" backward-kill-line   # "^u" is mapped to `kill-whole-line` by default
bindkey "^[u" kill-line           # `kill-line` default keymap ("^k") is overriden by tmux window navigation
bindkey "^X^R" redo               #
bindkey "^X^E" edit-command-line  #
bindkey "^Xy" copy-command-line   # Like "yank" in Vim/Neovim

# [[ Miscellaneous ]]

export EZA_CONFIG_DIR="$HOME/.config/eza"
export NVM_DIR="$HOME/.nvm"
export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

alias python='python3'

if command -v bat &>/dev/null; then
    alias cat='bat'
    alias head='bat --line-range :10'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Use bat to colorize the man pages
fi
if command -v dust &>/dev/null; then
    alias du='dust'
fi
if command -v eza &>/dev/null; then
    alias ls='eza -1 --color=always --icons=always --group-directories-first'
fi
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)" # Override `cd` and `cdi`
fi

if command -v fzf &>/dev/null; then
    [ -f "$HOME/.config/fzf/fzf.zsh" ] && source "$HOME/.config/fzf/fzf.zsh"
fi

autoload -U add-zsh-hook # Enable hooks definitions

# Auto-activate Python virtual environment
function activate_python_venv_hook() {
    if [[ -f "$PWD/.venv/bin/activate" ]]; then
        if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then # A different virtual environment is enabled or none is enabled
            [[ -n "$VIRTUAL_ENV" ]] && deactivate
            VIRTUAL_ENV_DISABLE_PROMPT=1 source "$PWD/.venv/bin/activate" # Don't alter the prompt to avoid disabling it entirely when using `deactivate` in a tmux session
        fi
    elif [[ -n "$VIRTUAL_ENV" && "$PWD" != "${VIRTUAL_ENV%/*}"* ]]; then # A virtual environment is enabled and we are no longer in its directory or subdirectories
        deactivate
    fi
}
add-zsh-hook chpwd activate_python_venv_hook # On directory change
activate_python_venv_hook                    # On shell startup

# Lazy-setup nvm on command or on file detection, to avoid slowing down shell startup
function load-nvm() {
    [[ -n "$NVM_LOADED" ]] && return
    NVM_LOADED=1
    unfunction nvm node npm npx 2>/dev/null # Remove the placeholder functions
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
function load-nvm-hook() {
    [[ -e .nvmrc ]] && load-nvm
}
function nvm() {
    load-nvm
    nvm "$@"
}
function node() {
    load-nvm
    node "$@"
}
function npm() {
    load-nvm
    npm "$@"
}
function npx() {
    load-nvm
    npx "$@"
}
add-zsh-hook chpwd load-nvm-hook # On directory change
load-nvm-hook                    # On shell startup

# Auto-use nvm
load-nvmrc-hook() {
    [[ -e .nvmrc ]] || return
    load-nvm
    current_node_version=$(nvm version)
    required_node_version=$(nvm version "$(\cat .nvmrc)")
    if [ "$required_node_version" = "N/A" ]; then
        nvm install
    elif [ "$required_node_version" != "$current_node_version" ]; then
        nvm use --silent
    fi
}
add-zsh-hook chpwd load-nvmrc-hook # On directory change
load-nvmrc-hook                    # On shell startup

# [[ Aliases ]]
# This should be near the end of the configuration

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# [[ Prompt ]]
# This should be at the very end of the configuration

if command -v starship &>/dev/null; then
    # Fix undesired new line at top top of terminal when entering or clearing it with `add_new_line = true` (source: https://github.com/starship/starship/issues/560)
    function precmd() {
        # shellcheck disable=SC2329
        precmd() {
            echo ""
        }
    }
    alias clear="precmd() { precmd() { echo } } && clear"

    eval "$(starship init zsh)"
fi
