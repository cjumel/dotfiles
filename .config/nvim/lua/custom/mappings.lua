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
  }
}

return M
