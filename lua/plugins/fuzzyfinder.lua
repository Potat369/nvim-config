return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"aznhe21/actions-preview.nvim",
		keys = {
			{
				"gra",
				function()
					require("actions-preview").code_actions()
				end,
				desc = "LSP Code Actions",
				mode = { "v", "n" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find files in neovim config" })
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = "~/nixos-config/" })
			end, { desc = "Find files in nixos config" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in current directory " })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in current directory" })
			vim.keymap.set("n", "<leader>fh", builtin.highlights, { desc = "Find highlights" })
		end,
		opts = {
			defaults = {
				file_ignore_patterns = {
					"**.git/*",
					"**\\.gradle/*",
					"**target/*",
				},
			},
		},
	},
}
