-- This page has been initialized with the output of `wezterm show-keys --lua`

local wezterm = require("wezterm")

return {

  -- [[ Default actions ]]
  { key = "e", mods = "SUPER", action = wezterm.action.ToggleFullScreen },
  { key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
  { key = "m", mods = "SUPER", action = wezterm.action.Hide },
  { key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
  { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
  { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

  -- [[ Custom actions ]]
  -- Reset
  {
    key = "r",
    mods = "CMD",
    action = wezterm.action.Multiple({
      wezterm.action.EmitEvent("reset-options"),
      wezterm.action.ResetFontAndWindowSize,
    }),
  },

  -- Font size
  { key = "f", mods = "CMD", action = wezterm.action.IncreaseFontSize },
  { key = "f", mods = "CMD|SHIFT", action = wezterm.action.DecreaseFontSize },

  -- Transparency
  { key = "t", mods = "CMD", action = wezterm.action.EmitEvent("increase-transparency") },
  { key = "t", mods = "CMD|SHIFT", action = wezterm.action.EmitEvent("decrease-transparency") },

  -- Blur
  { key = "b", mods = "CMD", action = wezterm.action.EmitEvent("increase-blur") },
  { key = "b", mods = "CMD|SHIFT", action = wezterm.action.EmitEvent("decrease-blur") },

  -- Ligatures
  { key = "l", mods = "CMD", action = wezterm.action.EmitEvent("toggle-ligatures") },

  -- [[ Fixesd control combinations with special keys ]]
  -- Enable some control keymaps with special characters by sending the right string given an input sequence
  -- This is inspired by https://github.com/wez/wezterm/issues/3180, & for terminal codes supported by Neovim see
  -- https://www.reddit.com/r/neovim/comments/okbag3/how_can_i_remap_ctrl_backspace_to_delete_a_word/
  -- Some control keymaps with special characters are already working:
  --  - <C-^> on my keyboard corresponds to <C-[> (escape)
  --  - <C-$> on my keyboard corresponds to <C-]>
  --  - <C-`> on my keyboard corresponds to <C-\>
  {
    key = "phys:Quote", -- "ù" key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x7f" }), -- <C-?> (delete)
  },
  {
    key = "phys:M", -- "," key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1e" }), -- <C-^>
  },
  {
    key = "phys:Comma", -- ";" key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1f" }), -- <C-_>
  },

  -- [[ New control keymaps ]]
  -- Map undefined control keymaps to the corresponding (but usable) alt keymaps
  {
    key = "Return",
    mods = "CTRL",
    action = wezterm.action({ SendKey = { key = "Return", mods = "ALT" } }),
  },
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action({ SendKey = { key = "Backspace", mods = "ALT" } }),
  },
}
