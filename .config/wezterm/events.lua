local wezterm = require("wezterm")

wezterm.on("toggle-transparency", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("toggle-light-theme", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.color_scheme then
    overrides.color_scheme = "catppuccin-latte"
  else
    overrides.color_scheme = nil
  end
  window:set_config_overrides(overrides)
end)
