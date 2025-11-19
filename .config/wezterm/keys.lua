-- This file has been initialized with the output of the `wezterm show-keys --lua` command

local wezterm = require("wezterm")

return {

  -- [[ Default actions ]]
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

  -- [[ Custom actions ]]
  { key = "r", mods = "SUPER", action = wezterm.action.EmitEvent("reset-options") },
  { key = "o", mods = "SUPER", action = wezterm.action.EmitEvent("decrease-opacity") },
  { key = "o", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("increase-opacity") },
  { key = "b", mods = "SUPER", action = wezterm.action.EmitEvent("increase-blur") },
  { key = "b", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("decrease-blur") },

  -- [[ Complex key combinations ]]
  -- Redefine keycodes for less common key combinations to make them work through tmux
  -- In the following, a leading "^[" in a keycode is actually an escape sequence
  { key = "Return", mods = "SHIFT", action = wezterm.action({ SendString = "[13;2u" }) },
  { key = "Return", mods = "CTRL", action = wezterm.action({ SendString = "[13;5u" }) },
  { key = "Backspace", mods = "SHIFT", action = wezterm.action({ SendString = "[127;2u" }) },
  { key = "Backspace", mods = "CTRL", action = wezterm.action({ SendString = "[127;5u" }) },
}
