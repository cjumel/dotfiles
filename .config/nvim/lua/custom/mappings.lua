local M = {}

M.general = {
	n = {
		-- vim-tmux-navigator
		["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },
		-- splits
		["<leader>v"] = { "<cmd> vsplit <CR>", "Vertical split" },
		["<leader>h"] = { "<cmd> split <CR>", "Horizontal split" },
		-- nvim-tree
		["<leader>n"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvim-tree" },
		-- telescope
		["<leader>fc"] = {
			function()
				require("telescope.builtin").git_commits()
			end,
			"Git commits",
		},
		["<leader>ff"] = {
			function()
				require("telescope.builtin").find_files({
					find_command = { "rg", "--files", "--hidden" },
				})
			end,
			"Find files",
		},
		["<leader>fg"] = {
			function()
				require("telescope.builtin").live_grep()
			end,
			"Live grep",
		},
		["<leader>fo"] = {
			function()
				require("telescope.builtin").oldfiles({
					cwd_only = true,
				})
			end,
			"Find old files",
		},
		["<leader>fs"] = {
			function()
				require("telescope.builtin").git_status()
			end,
			"Git status",
		},
		-- vim-fugitive
		["<leader>gs"] = {
			"<cmd> tab Git <CR> \
      <cmd> highlight diffAdded guifg=#abe9b3 <CR> \
      <cmd> highlight diffRemoved guifg=#f38ba8 <CR>",
			"Git status",
		},
		-- hop.nvim
		["s"] = {
			function()
				require("hop").hint_char2()
			end,
			"Jump to a combinaison of 2 keys",
		},
		["f"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following key inline",
		},
		["F"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding key inline",
		},
		["t"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			"Jump to before a following key inline",
		},
		["T"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1,
				})
			end,
			"Jump to after a preceding key inline",
		},
		["<leader>w"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word beginning inline",
		},
		["<leader>b"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word beginning inline",
		},
		["<leader>e"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word end inline",
		},
		["<leader>ge"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word end inline",
		},
		["<leader>j"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
				})
			end,
			"Jump to a following line",
		},
		["<leader>k"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
				})
			end,
			"Jump to a preceding line",
		},
	},
	x = {
		-- hop.nvim
		["s"] = {
			function()
				require("hop").hint_char2()
			end,
			"Jump to a combinaison of 2 keys",
		},
		["f"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following key inline",
		},
		["F"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding key inline",
		},
		["t"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			"Jump to before a following key inline",
		},
		["T"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1,
				})
			end,
			"Jump to after a preceding key inline",
		},
		["<leader>w"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word beginning inline",
		},
		["<leader>b"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word beginning inline",
		},
		["<leader>e"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word end inline",
		},
		["<leader>ge"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word end inline",
		},
		["<leader>j"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
				})
			end,
			"Jump to a following line",
		},
		["<leader>k"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
				})
			end,
			"Jump to a preceding line",
		},
	},
	o = {
		-- hop.nvim
		["s"] = {
			function()
				require("hop").hint_char2()
			end,
			"Jump to a combinaison of 2 keys",
		},
		["f"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following key inline",
		},
		["F"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding key inline",
		},
		["t"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			"Jump to before a following key inline",
		},
		["T"] = {
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1,
				})
			end,
			"Jump to after a preceding key inline",
		},
		["<leader>w"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word beginning inline",
		},
		["<leader>b"] = {
			function()
				require("hop").hint_words({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word beginning inline",
		},
		["<leader>e"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a following word end inline",
		},
		["<leader>ge"] = {
			function()
				require("hop").hint_words({
					hint_position = require("hop.hint").HintPosition.END,
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			"Jump to a preceding word end inline",
		},
		["<leader>j"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
				})
			end,
			"Jump to a following line",
		},
		["<leader>k"] = {
			function()
				require("hop").hint_lines({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
				})
			end,
			"Jump to a preceding line",
		},
	},
}

M.disabled = {
	n = {
		-- telescope
		["<leader>cm"] = "",
		["<leader>fw"] = "",
		["<leader>gt"] = "",
		-- Makes <leader>w slow
		["<leader>wa"] = "",
		["<leader>wk"] = "",
		["<leader>wK"] = "",
		["<leader>wl"] = "",
		["<leader>wr"] = "",
	},
	v = {
		-- Makes <leader>w slow
		["<leader>wa"] = "",
		["<leader>wk"] = "",
		["<leader>wK"] = "",
		["<leader>wl"] = "",
		["<leader>wr"] = "",
	},
}

return M
