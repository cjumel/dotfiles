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

# Change the terminal theme with fzf by prompting the user for a new theme & creating the relevant symlinks
function change_theme() {
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

alias ct='change_theme' # Change theme: prompt the user to select a new terminal theme & set it up
