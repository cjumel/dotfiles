local M = {}

M.general = {
  n = {
    -- vim-tmux-navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },
    -- vim-fugitive
    ["<leader>gs"] = {
      "<cmd> tab Git <CR> \
      <cmd> highlight diffAdded guifg=#abe9b3 <CR> \
      <cmd> highlight diffRemoved guifg=#f38ba8 <CR>",
      "Git status",
    },
    -- hop.nvim
    ["s"] = {"<cmd> HopChar2 <CR>", "Jump to any combinaison of 2 keys"},
    ["<leader>w"] = { "<cmd> HopWordCurrentLineAC <CR>", "Jump to any word after the cursor" },
    ["<leader>b"] = { "<cmd> HopWordCurrentLineBC <CR>", "Jump to any word before the cursor" },
    ["<leader>j"] = { "<cmd> HopLineAC <CR>", "Jump to any line after the cursor" },
    ["<leader>k"] = { "<cmd> HopLineBC <CR>", "Jump to any line before the cursor" },
    -- To-do comments
    ["to"] = {"O# todo<ESC>", "Write a to-do comment above the line cursor"},
    ["ti"] = {"I# todo <ESC>", "Write a to-do comment at the beginning of the line cursor"},
    ["ta"] = {"A# todo<ESC>", "Write a to-do comment at the end of the line cursor"},
  },
  v = {
    -- hop.nvim
    ["s"] = {"<cmd> HopChar2 <CR>", "Jump to any combinaison of 2 keys"},
    ["<leader>w"] = { "<cmd> HopWordCurrentLineAC <CR>", "Jump to any word after the cursor" },
    ["<leader>b"] = { "<cmd> HopWordCurrentLineBC <CR>", "Jump to any word before the cursor" },
    ["<leader>j"] = { "<cmd> HopLineAC <CR>", "Jump to any line after the cursor" },
    ["<leader>k"] = { "<cmd> HopLineBC <CR>", "Jump to any line before the cursor" },
  },
}

return M
