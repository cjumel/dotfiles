local theme = require("theme")
local utils = require("utils")
local wezterm = require("wezterm")

local config = {}

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
config.send_composed_key_when_left_alt_is_pressed = true -- To type special characters
config.send_composed_key_when_right_alt_is_pressed = false -- To type meta key combinations (used by home-row mods)

-- [[ Custom actions ]]

wezterm.on("reset-config", function(window, _)
  local overrides = window:get_config_overrides() or {}
  local default_config = theme.update_config(config, { force_reload = true })
  overrides = utils.merge_dicts({ overrides, default_config })
  window:set_config_overrides(overrides)
end)

wezterm.on("increase-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = config.window_background_opacity
  end
  local new_opacity = overrides.window_background_opacity + 0.05
  if new_opacity > 1.0 then
    new_opacity = 1.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)
wezterm.on("decrease-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = config.window_background_opacity
  end
  local new_opacity = overrides.window_background_opacity - 0.05
  if new_opacity < 0.0 then
    new_opacity = 0.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)

wezterm.on("increase-blur", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.macos_window_background_blur then
    overrides.macos_window_background_blur = config.macos_window_background_blur
  end
  local new_blur = overrides.macos_window_background_blur + 5
  overrides.macos_window_background_blur = new_blur
  window:set_config_overrides(overrides)
end)
wezterm.on("decrease-blur", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.macos_window_background_blur then
    overrides.macos_window_background_blur = config.macos_window_background_blur
  end
  local new_blur = overrides.macos_window_background_blur - 5
  if new_blur < 0 then
    new_blur = 0
  end
  overrides.macos_window_background_blur = new_blur
  window:set_config_overrides(overrides)
end)

-- [[ Keys ]]

config.keys = {
  -- Default actions
  { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
  { key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
  { key = "m", mods = "SUPER", action = wezterm.action.Hide },
  { key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
  { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
  { key = "+", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
  { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
  { key = "0", mods = "SUPER|SHIFT", action = wezterm.action.ResetFontAndWindowSize },
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

  -- Custom actions
  { key = "r", mods = "SUPER", action = wezterm.action.EmitEvent("reset-config") },
  { key = "o", mods = "SUPER", action = wezterm.action.EmitEvent("decrease-opacity") },
  { key = "o", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("increase-opacity") },
  { key = "b", mods = "SUPER", action = wezterm.action.EmitEvent("increase-blur") },
  { key = "b", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("decrease-blur") },
}

return config
