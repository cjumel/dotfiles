-- This page has been initialized with the output of `wezterm show-keys --lua`

local wezterm = require("wezterm")

local act = wezterm.action

return {

  -- [[ Default actions ]]
  { key = "e", mods = "SUPER", action = act.ToggleFullScreen },
  { key = "h", mods = "SUPER", action = act.HideApplication },
  { key = "m", mods = "SUPER", action = act.Hide },
  { key = "n", mods = "SUPER", action = act.SpawnWindow },
  { key = "q", mods = "SUPER", action = act.QuitApplication },
  { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
  { key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },

  -- [[ Custom actions ]]
  {
    key = "r",
    mods = "CMD",
    action = act.Multiple({ act.EmitEvent("reset-options"), act.ResetFontAndWindowSize }),
  },
  {
    key = "t", -- More transparency
    mods = "CMD",
    action = act.EmitEvent("increase-transparency"),
  },
  {
    key = "o", -- More opacity
    mods = "CMD",
    action = act.EmitEvent("decrease-transparency"),
  },
  {
    key = "b", -- Bigger font
    mods = "CMD",
    action = act.IncreaseFontSize,
  },
  {
    key = "s", -- Smaller font
    mods = "CMD",
    action = act.DecreaseFontSize,
  },

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
