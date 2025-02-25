local wezterm = require("wezterm")

local config = {}

-- Window
config.hide_tab_bar_if_only_one_tab = true -- No tab bar if only one tab
config.window_decorations = "RESIZE" -- No title bar but allow resizing nonetheless
config.initial_cols = 156
config.initial_rows = 42
config.window_background_opacity = 1.0 -- Fully opaque window
config.macos_window_background_blur = 10 -- Background blur if window is not fully opaque
config.window_close_confirmation = "NeverPrompt" -- Don't ask for confirmation when closing with Cmd+q
config.colors = {} -- Reset colors in case a theme has set some

-- Font
-- I don't use the bundled font as I had some issues with it regarding inconsistent icon sizes
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 12.0
config.adjust_window_size_when_changing_font_size = false

-- Make possible to type option-key combinations, like "{" and "}"
config.send_composed_key_when_left_alt_is_pressed = true

-- Disable default key bindings as I don't use most of them & some are conflicting with my own
config.disable_default_key_bindings = true

return config
