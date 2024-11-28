# N[V][I]m: a modern Vim-based text editor

# Override the default `vi` command
alias vi='nvim'                         # Open Neovim
alias vic='nvim --clean'                # [C]lean: open Neovim without any custom configuration
alias vil='NVIM_LIGHT_MODE=true nvim'   # [L]ight: open Neovim in light mode
alias vix='rm -rf ~/.local/share/nvim/' # Discard: delete Neovim local files (not configuration files); useful to re-install Neovim from scratch
