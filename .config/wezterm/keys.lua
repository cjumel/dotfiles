-- This page has been initialized with the output of `wezterm show-keys --lua`

-- NOTE: the final list of complex key combinations which are supported in my Wezterm configuration but differ from the
-- physical keyboard equivalent is:
--  - <C-BS> on my physical keyboard corresponds to <C-w>
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
  { key = "e", mods = "SUPER", action = wezterm.action.ToggleFullScreen },
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
  -- Enable the use of <S-CR> and <C-CR> in tmux sessions
  -- Note that in the codes sent by the keymaps, the leading "^[" is actually obtained by entering, in Neovim's insert
  -- mode, <C-v> and <Esc> to obtain an escape sequence, and the rest of the codes are the actual keycodes
  -- To make sure this works, in Neovim's insert mode, type <C-v> and then <S-CR> or <C-CR> and you should see the
  -- corresponding mappings displayed
  -- Sources:
  --  - https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
  --  - https://stackoverflow.com/questions/78053422/how-can-i-get-shift-enter-escape-sequence-to-work-in-a-nested-tmux-session
  { key = "Return", mods = "SHIFT", action = wezterm.action({ SendString = "[13;2u" }) },
  { key = "Return", mods = "CTRL", action = wezterm.action({ SendString = "[13;5u" }) },

  -- Remap complex key combinations which has no or little use, to another complex key combinations which would have
  -- been previously impossible or difficulat to type
  -- Sources:
  --  - https://github.com/wez/wezterm/issues/3180,
  --  - https://www.reddit.com/r/neovim/comments/okbag3/how_can_i_remap_ctrl_backspace_to_delete_a_word/
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action({ SendKey = { key = "w", mods = "CTRL" } }),
  },
  {
    key = "phys:Quote", -- "ù" on my physical keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x7f" }), -- <BS>/<C-?>
  },
  {
    key = "phys:M", -- "," on my physical keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1e" }), -- <C-^>
  },
  {
    key = "phys:Comma", -- ";" on my physical keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1f" }), -- <C-_>
  },
}
