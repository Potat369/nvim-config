return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			rust_analyzer = {},
			nixd = {},
			phpactor = {},
			astro = {},
			csharp_ls = {},
			ts_ls = {},
			emmet_language_server = {},
			cssls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			},
			pylsp = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
