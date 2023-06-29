local M = {}

M.general = {
  n = {
    -- vim-tmux-navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },
    -- vim-fugitive
    ["<leader>gs"] = { "<cmd> tab Git <CR>", "Git status" },
    -- hop.nvim
    ["s"] = {"<cmd> HopChar2 <CR>", "Jump to any combinaison of 2 keys"},
    ["<leader>w"] = { "<cmd> HopWordCurrentLineAC <CR>", "Jump to any word after the cursor" },
    ["<leader>b"] = { "<cmd> HopWordCurrentLineBC <CR>", "Jump to any word before the cursor" },
    ["<leader>j"] = { "<cmd> HopLineAC <CR>", "Jump to any line after the cursor" },
    ["<leader>k"] = { "<cmd> HopLineBC <CR>", "Jump to any line before the cursor" },
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
