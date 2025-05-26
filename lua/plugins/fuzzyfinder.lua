return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = "/etc/nixos/" })
		end)
		vim.keymap.set("n", "<leader>ff", builtin.find_files)
	end,
	opts = {
		defaults = {
			file_ignore_patterns = {
				"**.git/*",
				"**.gradle/*",
				"**target/*",
			},
		},
	},
}
