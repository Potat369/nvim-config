return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost" },
	keys = {
		{ "<leader>gs", ":Gitsigns stage_hunk<CR>", desc = "Git stage hunk" },
		{ "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Git preview hunk" },
		{ "<leader>gn", ":Gitsigns next_hunk<CR>", desc = "Git next hunk" },
		{ "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", desc = "Git preview hunk inline" },
		{ "<leader>gr", ":Gitsigns reset_hunk<CR>", desc = "Git reset hunk" },
		{
			"<leader>gc",
			function()
				local message = vim.fn.input("Enter commit message: ")
				vim.fn.execute('!git commit -m "' .. message .. '"')
			end,
			{ desc = "Git commit" },
		},
	},
	opts = {
		attach_to_untracked = true,
		signs = {
			add = { text = "▏" },
			change = { text = "▏" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "▏" },
		},
		signs_staged = {
			add = { text = "▏" },
			change = { text = "▏" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "▏" },
		},
	},
}
