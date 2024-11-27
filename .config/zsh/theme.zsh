# [[ Theme ]]
# Provide features to manage the terminal-level theme.

# List available themes and their descriptions (default one first, then in alphabetical order of main themes, then darkest to lightest)
TERMINAL_THEMES="default                     -- default theme, lean and black
catppuccin-mocha            -- darkest Catppucin theme
catppuccin-macchiato        -- intermediately dark Catppucin theme
catppuccin-frappe           -- least dark Catppucin theme
catppuccin-latte            -- light Catppucin theme
gruvbox-dark                -- dark Gruvbox theme
gruvbox-light               -- light Gruvbox theme
kanagawa-dragon             -- darkest Kanagawa theme
kanagawa-wave               -- least dark Kanagawa theme
kanagawa-lotus              -- light Kanagawa theme
nord                        -- blueish dark theme
onedark                     -- dark One theme
onelight                    -- light One theme
rose-pine-main              -- darkest Rose-pine theme
rose-pine-moon              -- least dark Rose-pine theme
rose-pine-dawn              -- light Rose-pine theme
tokyonight-night            -- darkest Tokyonight theme
tokyonight-moon             -- intermmediatly dark Tokyonight theme
tokyonight-storm            -- least dark Tokyonight theme
tokyonight-day              -- light Tokyonight theme"

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
