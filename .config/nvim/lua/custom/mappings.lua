local M = {}
M.general = {
  n = {
    -- vim-tmux-navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- vim-fugitive
    ["<leader>gs"] = { "<cmd> tab Git<CR>", "Git status" },
  }
}
return M
