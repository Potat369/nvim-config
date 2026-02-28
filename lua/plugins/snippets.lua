return {
	{
		"rafamadriz/friendly-snippets",
		lazy = true,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" },
		submodules = false,
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
