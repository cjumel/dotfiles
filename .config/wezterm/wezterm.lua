local wezterm = require("wezterm")

local config = {}

-- [[ Options ]]

-- Window
config.hide_tab_bar_if_only_one_tab = true -- No tab bar if only one tab
config.window_decorations = "RESIZE" -- No title bar but allow resizing nonetheless
config.initial_cols = 156
config.initial_rows = 42

-- Color scheme
config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.8

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 13.0

-- Make possible to type option-key combinations, like "{" and "}"
config.send_composed_key_when_left_alt_is_pressed = true

-- [[ Keymaps ]]
-- In addition to the keymaps setup here, I introduced in MacOS system settings custom application
-- keyboard mappings, cmd-ctrl-f for "Enter Full Screen" and "Exit Full Screen", in order
-- to use MacOS native full screen mode, in addtion to WezTerm full screen mode (with opt+enter).

-- Set the leader key
config.leader = { key = " ", mods = "OPT", timeout_milliseconds = 1000 }

config.keys = {
  {
    -- Move-to-screen keymap causes WezTerm's window to change size, this keymap is convenient to
    -- reset it to the default size
    key = "r",
    mods = "CMD|CTRL",
    action = wezterm.action.ResetFontAndWindowSize,
  },
}

return config
