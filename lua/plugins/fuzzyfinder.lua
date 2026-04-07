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
		cmd = "Telescope",
		keys = {
			{
				"<leader>fc",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find files in neovim config",
			},
			{
				"<leader>fn",
				function()
					require("telescope.builtin").find_files({ cwd = "~/nixos-config/" })
				end,
				desc = "Find files in nixos config",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files in cwd",
			},

			{
				"<leader>fgc",
				function()
					require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Grep files in neovim config",
			},
			{
				"<leader>fgn",
				function()
					require("telescope.builtin").live_grep({ cwd = "~/nixos-config/" })
				end,
				desc = "Grep files in nixos config",
			},
			{
				"<leader>fgf",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Grep files in cwd",
			},

			{
				"<leader>fh",
				function()
					require("telescope.builtin").highlights()
				end,
				desc = "Find highlight groups",
			},
		},
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
