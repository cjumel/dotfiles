local wezterm = require("wezterm")

local config = {}

config.automatically_reload_config = false

-- [[ Window ]]
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE" -- Hide title bar
config.initial_cols = 156
config.initial_rows = 42
config.window_background_opacity = 1.0
config.macos_window_background_blur = 10
config.window_close_confirmation = "NeverPrompt"
config.colors = {} -- Reset colors in favor of the theme's one

-- [[ Font ]]
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 12.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Remove ligatures
config.adjust_window_size_when_changing_font_size = false

-- [[ Keyboard ]]
config.disable_default_key_bindings = true
config.enable_kitty_keyboard = true -- Make possible to use less common keymaps like <C-CR> or <C-S-a> in tmux
local send_composed_key_when_alt_is_pressed = wezterm.GLOBAL.send_composed_key_when_alt_is_pressed or false -- Enable meta combinations by default
config.send_composed_key_when_left_alt_is_pressed = send_composed_key_when_alt_is_pressed
config.send_composed_key_when_right_alt_is_pressed = send_composed_key_when_alt_is_pressed

-- [[ Custom actions ]]

wezterm.on("switch-alt-key-mode", function(window, _)
  wezterm.GLOBAL.send_composed_key_when_alt_is_pressed = not wezterm.GLOBAL.send_composed_key_when_alt_is_pressed
  wezterm.reload_configuration()
  local message = wezterm.GLOBAL.send_composed_key_when_alt_is_pressed and "Alt sends composed keys"
    or "Alt sends meta combinations"
  window:toast_notification("WezTerm", message, nil, 2000)
end)

local function make_adjuster(event, key, delta, min, max)
  wezterm.on(event, function(window, _)
    local overrides = window:get_config_overrides() or {}
    local value = overrides[key] or config[key]
    overrides[key] = math.max(min, math.min(max, value + delta))
    window:set_config_overrides(overrides)
  end)
end

make_adjuster("increase-opacity", "window_background_opacity", 0.05, 0.0, 1.0)
make_adjuster("decrease-opacity", "window_background_opacity", -0.05, 0.0, 1.0)
make_adjuster("increase-blur", "macos_window_background_blur", 5, 0, 100)
make_adjuster("decrease-blur", "macos_window_background_blur", -5, 0, 100)

-- [[ Keys ]]

config.keys = {
  -- MacOS window management
  { key = "f", mods = "SUPER|CTRL", action = wezterm.action.ToggleFullScreen },
  { key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
  { key = "m", mods = "SUPER", action = wezterm.action.Hide },
  { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },

  -- Default actions
  { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
  { key = "+", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
  { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
  { key = "1", mods = "SUPER", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "SUPER", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "SUPER", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "SUPER", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "SUPER", action = wezterm.action.ActivateTab(4) },
  { key = "6", mods = "SUPER", action = wezterm.action.ActivateTab(5) },
  { key = "7", mods = "SUPER", action = wezterm.action.ActivateTab(6) },
  { key = "8", mods = "SUPER", action = wezterm.action.ActivateTab(7) },
  { key = "9", mods = "SUPER", action = wezterm.action.ActivateTab(8) },
  { key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
  { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
  {
    key = "r",
    mods = "SUPER",
    action = wezterm.action_callback(function(window, pane)
      window:toast_notification("wezterm", "Configuration reloaded", nil, 2000)
      window:perform_action(wezterm.action.ReloadConfiguration, pane)
    end),
  },

  -- Custom actions
  { key = "a", mods = "SUPER", action = wezterm.action.EmitEvent("switch-alt-key-mode") },
  { key = "o", mods = "SUPER", action = wezterm.action.EmitEvent("decrease-opacity") },
  { key = "o", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("increase-opacity") },
  { key = "b", mods = "SUPER", action = wezterm.action.EmitEvent("increase-blur") },
  { key = "b", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("decrease-blur") },
}

return config
