-- This page has been initialized with the output of `wezterm show-keys --lua`

-- NOTE: the final list of complex key combinations which are supported in my Wezterm configuration but differ from the
-- physical keyboard equivalent is:
--  - <C-^> on my physical keyboard corresponds to <C-[>
--  - <C-$> on my physical keyboard corresponds to <C-]>
--  - <C-m> on my physical keyboard corresponds to <CR>
--  - <C-ù> on my physical keyboard corresponds to <BS>/<C-?>
--  - <C-`> on my physical keyboard corresponds to <C-\>
--  - <C-,> on my physical keyboard corresponds to <C-^>
--  - <C-;> on my physical keyboard corresponds to <C-_>

local wezterm = require("wezterm")

return {

  -- [[ Default actions ]]
  { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
  { key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
  { key = "m", mods = "SUPER", action = wezterm.action.Hide },
  { key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
  { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
  { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
  { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
  { key = "à", mods = "SUPER", action = wezterm.action.ResetFontAndWindowSize },

  -- [[ Custom actions ]]
  { key = "r", mods = "SUPER", action = wezterm.action.EmitEvent("reset-options") },
  { key = "l", mods = "SUPER", action = wezterm.action.EmitEvent("toggle-ligatures") },
  { key = "t", mods = "SUPER", action = wezterm.action.EmitEvent("increase-transparency") },
  { key = "t", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("decrease-transparency") },
  { key = "b", mods = "SUPER", action = wezterm.action.EmitEvent("increase-blur") },
  { key = "b", mods = "SUPER|SHIFT", action = wezterm.action.EmitEvent("decrease-blur") },

  -- [[ Complex key combinations ]]
  -- Enable or remap altogether some complex key combinations. In the following, a leading "^[" in a keycode is actually
  -- an escape sequence (can be obtained in Neovim with <C-v> and <Esc> in insert mode).
  { key = "Return", mods = "SHIFT", action = wezterm.action({ SendString = "[13;2u" }) },
  { key = "Return", mods = "CTRL", action = wezterm.action({ SendString = "[13;5u" }) },
  { key = "Backspace", mods = "SHIFT", action = wezterm.action({ SendString = "[127;2u" }) },
  { key = "Backspace", mods = "CTRL", action = wezterm.action({ SendString = "[127;5u" }) },
  { key = "phys:Quote", mods = "CTRL", action = wezterm.action({ SendString = "\x7f" }) }, -- Keyboard <C-ù> -> <C-?>
  { key = "phys:M", mods = "CTRL", action = wezterm.action({ SendString = "\x1e" }) }, -- Keyboard <C-,> -> <C-^>
  { key = "phys:Comma", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) }, -- Keyboard <C-;> -> <C-_>
}
