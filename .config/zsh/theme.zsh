# [[ Theme ]]
# Provide features to manage the terminal-level theme.

# List available themes and their descriptions (default one first, then in alphabetical order of main themes, then darkest to lightest)
TERMINAL_THEMES="default
catppuccin-mocha
catppuccin-macchiato
catppuccin-frappe
catppuccin-latte
gruvbox-dark
gruvbox-light
kanagawa-dragon
kanagawa-wave
kanagawa-lotus
nord
onedark
onelight
rose-pine-main
rose-pine-moon
rose-pine-dawn
tokyonight-night
tokyonight-moon
tokyonight-storm
tokyonight-day"

# Change the terminal theme with fzf by prompting the user for a new theme & creating the relevant symlinks
function change_theme() {
    # Make the user select a theme using fzf among the available ones
    selected_theme_and_description=$(echo "$TERMINAL_THEMES" | fzf --prompt="Theme > ")
    selected_theme=$(echo "$selected_theme_and_description" | head -n1 | awk '{print $1;}')

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
