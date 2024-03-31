local wezterm = require("wezterm")

wezterm.on("toggle-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("increase-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  end
  local new_opacity = overrides.window_background_opacity + 0.05
  if new_opacity > 1.0 then
    new_opacity = 1.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)

wezterm.on("toggle-transparency", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("increase-transparency", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  end
  local new_opacity = overrides.window_background_opacity - 0.05
  if new_opacity < 0.0 then
    new_opacity = 0.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)
