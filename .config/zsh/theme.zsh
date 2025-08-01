# [[ Theme ]]
# Provide features to manage the terminal-level theme.

# List available themes with custom ordering
TERMINAL_THEMES="0-0 default
1-0 catppuccin-macchiato
1-1 catppuccin-mocha
1-2 catppuccin-frappe
1-3 catppuccin-latte
2-0 everforest-dark
2-1 everforest-light
3-0 gruvbox-dark
3-1 gruvbox-light
4-0 kanagawa-wave
4-1 kanagawa-dragon
4-2 kanagawa-lotus
5-0 onedark
5-1 onelight
6-0 rose-pine-moon
6-1 rose-pine-main
6-2 rose-pine-dawn
7-0 tokyonight-moon
7-1 tokyonight-night
7-2 tokyonight-storm
7-3 tokyonight-day"

# Change the terminal theme with fzf by prompting the user for a new theme & creating the relevant symlinks
function change_theme() {
    # Make the user select a theme using fzf among the available ones
    selected_theme_and_description=$(echo "$TERMINAL_THEMES" | fzf --prompt="Theme > " --with-nth=2..)
    selected_theme=$(echo "$selected_theme_and_description" | head -n1 | awk '{print $1;}')

    # Exit if no theme is selected, to avoid creating broken symlinks
    if [[ -z $selected_theme ]]; then
        return
    fi

    # Create symlinks to the selected theme (overwrite existing ones)
    ln -sf ~/.config/wezterm/theme/"$selected_theme".lua ~/.config/wezterm/theme/current.lua
    ln -sf ~/.config/tmux/theme/tmux-"$selected_theme".conf ~/.config/tmux/theme/tmux-current.conf
    ln -sf ~/.config/nvim/lua/config/theme/"$selected_theme".lua ~/.config/nvim/lua/config/theme/current.lua
}
