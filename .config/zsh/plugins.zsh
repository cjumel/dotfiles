# [[ Zinit setup ]]
# Zinit is a modern plugin manager for zsh, at the same time simple, powerful & very fast

# Directory where zinit & its plugins will be stored
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it's not already there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# [[ fzf-tab ]]
# `fzf-tab` provides a tab-completion implementation with `fzf`, enabling fuzzy finding & previewing candidates
# `fzf-tab` should be loaded before plugins like `zsh-autosuggestions`

zinit light Aloxaf/fzf-tab

# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# Prevent fzf window from being too small when a small number of completions is available
zstyle ':fzf-tab:*' fzf-flags --height=30
# Preview directory's content with `eza` when completing the builtin `cd` or `zoxide`
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a1 --color=always $realpath'

# [[ Zsh standard plugins ]]
# A few standard plugins for zsh, enabling syntax highlighting (show valid/invalid commands, paths, etc.), autosuggestions (suggest
# commands in ghost text based on command history) & additional tool completions (e.g. for `pre-commit`)

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

bindkey '^y' autosuggest-accept
