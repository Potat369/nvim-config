return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{
				"<leader>o",
				"<CMD>Oil<CR>",
			},
		},
		opts = {
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return name == ".."
				end,
			},
		},
	},
}
